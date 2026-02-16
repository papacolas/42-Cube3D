# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::   #
#    Makefile                                           :+:      :+:    :+:   #
#                                                     +:+ +:+         +:+     #
#    By: cub3D                                      +#+  +:+       +#+        #
#                                                 +#+#+#+#+#+   +#+           #
#    Created: 2025/10/06 00:00:00 by cub3D             #+#    #+#             #
#    Updated: 2025/10/06 00:00:00 by cub3D            ###   ########.fr       #
#                                                                              #
# **************************************************************************** #

# ================================ COLORS ================================== #
RESET	= \033[0m
RED		= \033[31m
GREEN	= \033[32m
YELLOW	= \033[33m
BLUE	= \033[34m
PURPLE	= \033[35m
CYAN	= \033[36m
WHITE	= \033[37m

# =============================== VARIABLES =============================== #
NAME		:= cub3D

CC			:= cc
CFLAGS		:= -Wall -Wextra -Werror

# ================================ PATHS =================================== #
INCDIR		:= includes
SRCDIR		:= src
BUILDDIR	:= build
OBJDIR		:= $(BUILDDIR)/obj

# =============================== LIBRARIES =============================== #
LIBFT_DIR	:= libft
LIBFT		:= $(LIBFT_DIR)/libft.a

MLX_DIR		?= minilibx-linux
MLX_FLAGS	:= -L$(MLX_DIR) -lmlx -lXext -lX11 -lm

# =============================== INCLUDES ================================= #
INCS		:= -I$(INCDIR) -I$(MLX_DIR) -I$(LIBFT_DIR)/includes

# =============================== SOURCE FILES ============================= #
SRC	:= \
	$(SRCDIR)/main.c \
	$(SRCDIR)/init.c \
	$(SRCDIR)/loop.c \
	$(SRCDIR)/input/keys.c \
	$(SRCDIR)/input/movement.c \
	$(SRCDIR)/render/draw.c \
	$(SRCDIR)/render/textures.c \
	$(SRCDIR)/render/texture_utils.c \
	$(SRCDIR)/render/background.c \
	$(SRCDIR)/render/raycasting.c \
	$(SRCDIR)/render/projection.c \
	$(SRCDIR)/render/projection_utils.c \
	$(SRCDIR)/render/dda.c \
	$(SRCDIR)/render/dda_utils.c \
	$(SRCDIR)/render/frame.c \
	$(SRCDIR)/parser/check_map_closed.c \
	$(SRCDIR)/parser/find_player.c \
	$(SRCDIR)/parser/map_neighbors.c \
	$(SRCDIR)/parser/map_utils.c \
	$(SRCDIR)/parser/validate_player.c \
	$(SRCDIR)/parser/parse_file.c \
	$(SRCDIR)/parser/parse_file_utils.c \
	$(SRCDIR)/parser/parse_input.c \
	$(SRCDIR)/parser/parse_tex.c \
	$(SRCDIR)/parser/parse_map.c \
	$(SRCDIR)/parser/parse_color.c \
	$(SRCDIR)/parser/parsing_utils.c \
	$(SRCDIR)/parser/parse_line_handlers.c \
	$(SRCDIR)/utils/errors.c \
	$(SRCDIR)/utils/mem.c \
	$(SRCDIR)/utils/free.c

OBJ	:= $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRC))


# ============================= COMPILATION =============================== #
all: $(NAME)

$(NAME): mlx $(LIBFT) $(OBJ)
	@printf "$(YELLOW)Linking $(NAME)...$(RESET)\n"
	@$(CC) $(CFLAGS) $(OBJ) $(LIBFT) $(MLX_FLAGS) -o $(NAME)
	@printf "$(GREEN)✓ $(NAME) built successfully!$(RESET)\n"

# ============================== OBJECT FILES ============================= #
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(dir $@)
	@printf "$(BLUE)Compiling $(notdir $<)...$(RESET)\n"
	@$(CC) $(CFLAGS) $(INCS) -c $< -o $@

# ============================== DEPENDENCIES ============================= #
$(LIBFT):
	@printf "$(CYAN)Building libft...$(RESET)\n"
	@$(MAKE) -C $(LIBFT_DIR) -s

mlx:
	@if [ -f "$(MLX_DIR)/Makefile" ]; then \
		printf "$(CYAN)Building MiniLibX...$(RESET)\n"; \
		$(MAKE) -C $(MLX_DIR) -s > /dev/null 2>&1; \
	else \
		printf "$(YELLOW)[INFO] No local MiniLibX at '$(MLX_DIR)'. Using system MLX.$(RESET)\n"; \
	fi

# =============================== CLEANING ================================= #
clean:
	@printf "$(RED)Cleaning object files...$(RESET)\n"
	@$(MAKE) -C $(LIBFT_DIR) clean -s
	@rm -rf $(OBJDIR)
	@printf "$(GREEN)✓ Object files cleaned$(RESET)\n"

fclean: clean
	@printf "$(RED)Full cleaning...$(RESET)\n"
	@$(MAKE) -C $(LIBFT_DIR) fclean -s
	@rm -rf $(BUILDDIR)
	@rm -f $(NAME)
	@printf "$(GREEN)✓ Everything cleaned$(RESET)\n"

re: fclean all

# ================================= RULES =================================== #
.PHONY: all clean fclean re mlx

