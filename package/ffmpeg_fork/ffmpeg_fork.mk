################################################################################
#
# ffmpeg_fork
#
################################################################################

FFMPEG_FORK_VERSION = 7f9b826bf2fbf6acf0e8ce032f3e7c311403301b
FFMPEG_FORK_SITE = https://github.com/ArhiChief/ffmpeg_fork
FFMPEG_FORK_SITE_METHOD = git
FFMPEG_FORK_INSTALL_STAGING = YES

FFMPEG_FORK_LICENSE = LGPLv2.1+, libjpeg license
FFMPEG_FORK_LICENSE_FILES = LICENSE.md COPYING.LGPLv2.1


FFMPEG_FORK_CONF_OPTS = \
	--prefix=/usr \
	--disable-debug \
	--disable-filters \
	--enable-small \
	--disable-runtime-cpudetect \
	--disable-ffplay \
	--disable-ffserver \
	--disable-ffprobe \
	--enable-gpl \
	--enable-version3 \
	--disable-postproc \
	--disable-decoders \
	--enable-decoder=aac \
	--enable-decoder=aac_fixed \
	--enable-decoder=aac_latm \
	--enable-decoder=h264 \
	--enable-decoder=h264_crystalhd \
	--enable-decoder=hevc \
	--enable-decoder=hevc_cuvid \
	--enable-decoder=hevc_qsv \
	--disable-encoders \
	--disable-demuxers \
	--enable-demuxer=aac \
	--enable-demuxer=h264 \
	--enable-demuxer=hls \
	--enable-demuxer=mpegts \
	--enable-demuxer=rtp \
	--enable-demuxer=rtsp \
	--enable-demuxer=hevc \
	--disable-muxers \
	--enable-muxer=mpegts \
	--enable-muxer=h264 \
	--enable-muxer=hls \
	--enable-muxer=rtp \
	--enable-muxer=rtp_mpegts \
	--enable-muxer=rtsp \
	--enable-muxer=segment \
	--enable-muxer=hevc \
	--disable-parsers \
	--enable-parser=aac \
	--enable-parser=h264 \
	--enable-parser=hevc \
	--disable-bsfs \
	--enable-bsf=aac_adtstoasc \
	--enable-bsf=imx_dump_header \
	--enable-bsf=mpeg4_unpack_bframes \
	--enable-bsf=noise \
	--enable-bsf=remove_extradata \
	--enable-bsf=chomp \
	--enable-bsf=dump_extradata \
	--enable-bsf=h264_mp4toannexb \
	--disable-indevs \
	--disable-outdevs \
	--disable-static \
	--enable-shared

# Override FFMPEG_FORK_CONFIGURE_CMDS: FFmpeg does not support --target and others
define FFMPEG_FORK_CONFIGURE_CMDS
	(cd $(FFMPEG_FORK_SRCDIR) && rm -rf config.cache && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	$(FFMPEG_FORK_CONF_ENV) \
	./configure \
		--enable-cross-compile \
		--cross-prefix=$(TARGET_CROSS) \
		--sysroot=$(STAGING_DIR) \
		--host-cc="$(HOSTCC)" \
		--arch=$(BR2_ARCH) \
		--target-os="linux" \
		--disable-stripping \
		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
		$(SHARED_STATIC_LIBS_OPTS) \
		$(FFMPEG_FORK_CONF_OPTS) \
	)
endef

$(eval $(autotools-package))
