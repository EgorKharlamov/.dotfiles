NVIM_DIR := ~/.config/nvim/
NVIM_MASON_DIR := ~/.local/share/nvim/mason/
NVIM_CACHE_DIR := ~/.cache/nvim/

clean:
	rm -rf $(NVIM_DIR) $(NVIM_MASON_DIR) $(NVIM_CACHE_DIR)

install: clean
	mkdir -p $(NVIM_DIR) && cp -r ./* $(NVIM_DIR)
