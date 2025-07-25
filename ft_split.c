/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/25 13:44:05 by svaladar          #+#    #+#             */
/*   Updated: 2025/07/25 17:06:11 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>

char	**ft_split(char const *s, char c)
{
	if (!s)
		return (NULL);
	
}

static size_t	count_words(char *s, char c)
{
	int		n_word;
	size_t	i;

	while (*s)
	{
		if (*s != c && n_word == 0)
		{
			n_word = 1;
			i++;
		}
		else if (*s == c)
			n_word = 0;
		s++;
	}
	return (i);
}

static void	*ft_free(char	**ss, int count)
{
	int	i;

	i = 0;
	while (i < count)
	{
		free(ss[i]);
		i++;
	}
	free(ss);
	return (NULL);
}

static char	*new_word(char *c)
{
	char	*new_str;

	
}
