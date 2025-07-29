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

static size_t	ft_count_words(const char *s, char c)
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
		return (n_word);
}
	
static void	*ft_free(char **ss)
{
	size_t	i;

	i = 0;
	while (ss[i])
		free(ss[i++]);
	free(ss);
	return (NULL);
}

char	**ft_split(char const *s, char c)
{
	char	**res;
	int	start;
	int	end;
	size_t	i;

	if (!s || !(res = ft_calloc(sizeof(char *), ft_count_words(s, c) + 1)))
		return (NULL);
	start = 0;
	end = 0;
	i = 0;
	while (s[end])
	{
		while (s[end] == c)
			end++;
		start = end;
		while (s[end] && s[end] != c)
			end++;
		if (end > start)
		{
			res[i] = ft_substr(s, start, end - start);
			if (!res[i++])
				return (ft_free(res), NULL);
		}
	}
	return (res);
}
