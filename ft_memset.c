/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memset.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: svaladar <svaladar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/07/17 11:05:39 by svaladar          #+#    #+#             */
/*   Updated: 2025/08/06 16:15:31 by svaladar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memset(void *b, int c, size_t len)
{
	unsigned char	*temp;

	if (!b)
		return (NULL);
	temp = (unsigned char *) b;
	while (len > 0)
	{
		*(temp++) = (unsigned char) c;
		len--;
	}
	return (b);
}
