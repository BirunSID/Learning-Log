#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            float r, g, b;

            r = image[i][j].rgbtRed;
            g = image[i][j].rgbtGreen;
            b = image[i][j].rgbtBlue;

            float average = (r + g + b)/3.0;

            int rounded_average = round(average);

            image[i][j].rgbtRed = rounded_average;
            image[i][j].rgbtGreen = rounded_average;
            image[i][j].rgbtBlue = rounded_average;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width/2; j++)
        {
            RGBTRIPLE temp = image[i][j];
            image[i][j] = image[i][width - 1 - j];
            image[i][width - 1 - j] = temp;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];
    for (int h = 0; h < height; h++)
    {
        for (int w = 0; w < width; w++)
        {
            copy[h][w].rgbtRed = image[h][w].rgbtRed;
            copy[h][w].rgbtGreen = image[h][w].rgbtGreen;
            copy[h][w].rgbtBlue = image[h][w].rgbtBlue;
        }
    }

    for (int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            float counter = 0, total_Red = 0, total_Green = 0, total_Blue = 0;
            for(int height_offset = -1; height_offset < 2; height_offset++)
            {
                for(int width_offset = -1; width_offset < 2; width_offset++)
                {
                    int neighbor_i = i + height_offset;
                    int neighbor_j = j + width_offset;

                    if (neighbor_i >= 0 && neighbor_i < height && neighbor_j >= 0 && neighbor_j < width)
                    {
                        total_Red   += copy[neighbor_i][neighbor_j].rgbtRed;
                        total_Green += copy[neighbor_i][neighbor_j].rgbtGreen;
                        total_Blue  += copy[neighbor_i][neighbor_j].rgbtBlue;
                        counter++;
                    }
                }
            }

            int average_Red   = round((total_Red/counter));
            int average_Green = round((total_Green/counter));
            int average_Blue  = round((total_Blue/counter));

            image[i][j].rgbtRed   = average_Red;
            image[i][j].rgbtGreen = average_Green;
            image[i][j].rgbtBlue  = average_Blue;
        }
    }
    return;
}

// Detect edges
void edges(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];
    for (int h = 0; h < height; h++)
    {
        for (int w = 0; w < width; w++)
        {
            copy[h][w].rgbtRed = image[h][w].rgbtRed;
            copy[h][w].rgbtGreen = image[h][w].rgbtGreen;
            copy[h][w].rgbtBlue = image[h][w].rgbtBlue;
        }
    }

    int Gx[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    int Gy[3][3] = {{-1, -2, -1}, {0, 0, 0}, {1, 2, 1}};

    

    for (int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            float gx_Red = 0, gx_Green = 0, gx_Blue = 0;
            float gy_Red = 0, gy_Green = 0, gy_Blue = 0;

            for(int height_offset = -1; height_offset < 2; height_offset++)
            {
                for(int width_offset = -1; width_offset < 2; width_offset++)
                {
                    int neighbor_i = i + height_offset;
                    int neighbor_j = j + width_offset;

                    if (neighbor_i >= 0 && neighbor_i < height && neighbor_j >= 0 && neighbor_j < width)
                    {
                        gx_Red   += Gx[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtRed;
                        gx_Green += Gx[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtGreen;
                        gx_Blue  += Gx[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtBlue;

                        gy_Red   += Gy[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtRed;
                        gy_Green += Gy[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtGreen;
                        gy_Blue  += Gy[1 + height_offset][1 + width_offset] * copy[neighbor_i][neighbor_j].rgbtBlue;
                    }
                    else
                    {
                        // do nothing;
                    }
                }
            }

            int finalizer_Red   = round(sqrt((gx_Red*gx_Red) + (gy_Red*gy_Red)));
            int finalizer_Green = round(sqrt((gx_Green*gx_Green) + (gy_Green*gy_Green)));
            int finalizer_Blue  = round(sqrt((gx_Blue*gx_Blue) + (gy_Blue*gy_Blue)));

            if(finalizer_Red > 255)
            {
                finalizer_Red  = 255;
            }
            if(finalizer_Green > 255)
            {
                finalizer_Green  = 255;
            }
            if(finalizer_Blue > 255)
            {
                finalizer_Blue  = 255;
            }
            image[i][j].rgbtRed   = finalizer_Red;
            image[i][j].rgbtGreen = finalizer_Green;
            image[i][j].rgbtBlue  = finalizer_Blue;
        }
    }    
    return;
}