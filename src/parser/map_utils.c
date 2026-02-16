/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   map_utils.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hganet <hganet@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 05:15:00 by hugoganet         #+#    #+#             */
/*   Updated: 2025/10/06 18:29:54 by hganet           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

/**
 * @brief Vérifie si un voisin est valide (pas un espace ni hors limites).
 *
 * Permet de vérifier qu'une position voisine existe et n'est pas un
 * espace vide (' '). Un espace représente le vide/l'extérieur de la map
 * et doit invalider la fermeture si adjacent à une case traversable.
 *
 * Cette fonction est utilisée pour s'assurer que les cases traversables
 * ('0' ou joueur) ne sont pas adjacentes à des espaces (void).
 *
 * @param app Pointeur vers la structure principale contenant la map.
 * @param x Coordonnée horizontale.
 * @param y Coordonnée verticale.
 * @return int 1 si valide (dans limites ET pas un espace), 0 sinon.
 *
 */
int	is_valid_neighbor(t_app *app, int x, int y)
{
	if (y < 0 || y >= app->map.height)
		return (0);
	if (x < 0)
		return (0);
	if (!app->map.grid[y])
		return (0);
	if (x >= (int)ft_strlen(app->map.grid[y]))
		return (0);
	if (app->map.grid[y][x] == ' ')
		return (0);
	return (1);
}

/**
 * @brief Vérifie que tous les caractères de la map sont valides.
 *
 * Parcourt chaque cellule de la grille app->map.grid et valide que
 * seuls les caractères autorisés sont présents :
 * - '0' : espace vide (sol)
 * - '1' : mur
 * - ' ' : espace (vide non traversable)
 * - 'N', 'S', 'E', 'W' : position et orientation du joueur
 *
 * Si un caractère invalide est détecté, appelle error_msg() avec
 * un message explicite.
 *
 * @param app Pointeur vers la structure principale contenant la map.
 * @return int Retourne 0 si tous les caractères sont valides.
 *
 */
int	check_valid_chars(t_app *app)
{
	int		i;
	int		j;
	char	c;

	i = 0;
	while (i < app->map.height)
	{
		j = 0;
		while (app->map.grid[i] && app->map.grid[i][j])
		{
			c = app->map.grid[i][j];
			if (c != '0' && c != '1' && c != ' ' && c != 'N'
				&& c != 'S' && c != 'E' && c != 'W')
				return (error_msg("Invalid character in map"));
			j++;
		}
		i++;
	}
	return (0);
}
