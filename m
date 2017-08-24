Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:34896 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbdHXJW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 05:22:58 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/2] tests: Use POSIX '.' as 'source'
Date: Thu, 24 Aug 2017 12:23:29 +0300
Message-ID: <7674227.7nYp0WOcGB@avalon>
In-Reply-To: <1503528064-10454-2-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1503528064-10454-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <1503528064-10454-2-git-send-email-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday, 24 August 2017 01:41:03 EEST Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> On posix shells, only the '.' command is supported.
> Even when running on a full bash shell, the file to source must be
> either fully or locally qualified.

"must be" makes me think of a bash requirement, while I believe you mean it 
should be fully qualified to avoid picking a random version of the file that 
would be present in $PATH. Is my understanding correct ? If so I'll update the 
commit message when applying.

> Fix both issues by swapping to the posix standard
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0001.sh | 2 +-
>  tests/vsp-unit-test-0002.sh | 2 +-
>  tests/vsp-unit-test-0003.sh | 2 +-
>  tests/vsp-unit-test-0004.sh | 2 +-
>  tests/vsp-unit-test-0005.sh | 2 +-
>  tests/vsp-unit-test-0006.sh | 2 +-
>  tests/vsp-unit-test-0007.sh | 2 +-
>  tests/vsp-unit-test-0008.sh | 2 +-
>  tests/vsp-unit-test-0009.sh | 2 +-
>  tests/vsp-unit-test-0010.sh | 2 +-
>  tests/vsp-unit-test-0011.sh | 2 +-
>  tests/vsp-unit-test-0012.sh | 2 +-
>  tests/vsp-unit-test-0013.sh | 2 +-
>  tests/vsp-unit-test-0014.sh | 2 +-
>  tests/vsp-unit-test-0015.sh | 2 +-
>  tests/vsp-unit-test-0016.sh | 2 +-
>  tests/vsp-unit-test-0017.sh | 2 +-
>  tests/vsp-unit-test-0018.sh | 2 +-
>  tests/vsp-unit-test-0019.sh | 2 +-
>  tests/vsp-unit-test-0020.sh | 2 +-
>  tests/vsp-unit-test-0021.sh | 2 +-
>  tests/vsp-unit-test-0022.sh | 2 +-
>  tests/vsp-unit-test-0023.sh | 2 +-
>  23 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/vsp-unit-test-0001.sh b/tests/vsp-unit-test-0001.sh
> index 727ead7ffc4d..746e652418ff 100755
> --- a/tests/vsp-unit-test-0001.sh
> +++ b/tests/vsp-unit-test-0001.sh
> @@ -6,7 +6,7 @@
>  # by the WPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32
> XRGB32" diff --git a/tests/vsp-unit-test-0002.sh
> b/tests/vsp-unit-test-0002.sh index cc18126b7722..1a617a8b4d4d 100755
> --- a/tests/vsp-unit-test-0002.sh
> +++ b/tests/vsp-unit-test-0002.sh
> @@ -6,7 +6,7 @@
>  # by the WPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  formats="NV12M NV16M NV21M NV61M UYVY VYUY YUV420M YUV422M YUV444M YVU420M
> YVU422M YVU444M YUYV YVYU" diff --git a/tests/vsp-unit-test-0003.sh
> b/tests/vsp-unit-test-0003.sh index ff1cf3047a99..41c40b9ae1fb 100755
> --- a/tests/vsp-unit-test-0003.sh
> +++ b/tests/vsp-unit-test-0003.sh
> @@ -5,7 +5,7 @@
>  # pipeline with identical input and output formats.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 uds wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0004.sh b/tests/vsp-unit-test-0004.sh
> index 7dc5613f5450..69b875bbd81c 100755
> --- a/tests/vsp-unit-test-0004.sh
> +++ b/tests/vsp-unit-test-0004.sh
> @@ -5,7 +5,7 @@
>  # up at the RPF output.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="hgo rpf.0 wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0005.sh b/tests/vsp-unit-test-0005.sh
> index 66c26b49f759..04c79c4b321c 100755
> --- a/tests/vsp-unit-test-0005.sh
> +++ b/tests/vsp-unit-test-0005.sh
> @@ -5,7 +5,7 @@
>  # much, use RGB24 to simplify frame comparison.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 rpf.1 wpf.0"
>  optional_features="rpf.2 rpf.3 rpf.4"
> diff --git a/tests/vsp-unit-test-0006.sh b/tests/vsp-unit-test-0006.sh
> index 8e6a3fb5bc4e..8781498d3bcd 100755
> --- a/tests/vsp-unit-test-0006.sh
> +++ b/tests/vsp-unit-test-0006.sh
> @@ -4,7 +4,7 @@
>  # Test invalid pipelines, without an RPF or without a WPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  format=RGB24
> diff --git a/tests/vsp-unit-test-0007.sh b/tests/vsp-unit-test-0007.sh
> index 3e965134569a..d5ba44c2ab37 100755
> --- a/tests/vsp-unit-test-0007.sh
> +++ b/tests/vsp-unit-test-0007.sh
> @@ -4,7 +4,7 @@
>  # Test composition through the BRU in RGB and YUV formats.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 rpf.1 bru wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0008.sh b/tests/vsp-unit-test-0008.sh
> index 3c752c69a8f0..717560f8cfae 100755
> --- a/tests/vsp-unit-test-0008.sh
> +++ b/tests/vsp-unit-test-0008.sh
> @@ -5,7 +5,7 @@
>  # the pipeline, both before and after the scaler.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="bru rpf.0 uds wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0009.sh b/tests/vsp-unit-test-0009.sh
> index dbc2ec5e881c..8814665b01f8 100755
> --- a/tests/vsp-unit-test-0009.sh
> +++ b/tests/vsp-unit-test-0009.sh
> @@ -5,7 +5,7 @@
>  # much, use RGB24 to simplify frame comparison.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0 wpf.1"
>  optional_features="wpf.1 wpf.2 wpf.3"
> diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
> index 07fd478a7baf..268b1c44b440 100755
> --- a/tests/vsp-unit-test-0010.sh
> +++ b/tests/vsp-unit-test-0010.sh
> @@ -5,7 +5,7 @@
>  # RPF -> LUT -> WPF pipelines with identical input and output formats.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 clu lut wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0011.sh b/tests/vsp-unit-test-0011.sh
> index 9d7b4e9bf98b..6d24477a18cf 100755
> --- a/tests/vsp-unit-test-0011.sh
> +++ b/tests/vsp-unit-test-0011.sh
> @@ -4,7 +4,7 @@
>  # Test all combinations of horizontal flip, vertical flip and rotation on
> WPF.0. #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0 wpf.0[control:'Vertical+Flip']"
>  optional_features="wpf.0[control:'Horizontal+Flip']
> wpf.0[control:'Rotate']" diff --git a/tests/vsp-unit-test-0012.sh
> b/tests/vsp-unit-test-0012.sh index 0275d5646e26..4c843cdd880d 100755
> --- a/tests/vsp-unit-test-0012.sh
> +++ b/tests/vsp-unit-test-0012.sh
> @@ -4,7 +4,7 @@
>  # Test runtime modification of horizontal and vertical flipping on WPF.0.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0 wpf.0[control:'Vertical+Flip']"
>  optional_features="wpf.0[control:'Horizontal+Flip']"
> diff --git a/tests/vsp-unit-test-0013.sh b/tests/vsp-unit-test-0013.sh
> index 143f8472b015..ac05d904df3e 100755
> --- a/tests/vsp-unit-test-0013.sh
> +++ b/tests/vsp-unit-test-0013.sh
> @@ -6,7 +6,7 @@
>  # by the RPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32
> XRGB32" diff --git a/tests/vsp-unit-test-0014.sh
> b/tests/vsp-unit-test-0014.sh index cd3faacc3806..6d07bb2af34b 100755
> --- a/tests/vsp-unit-test-0014.sh
> +++ b/tests/vsp-unit-test-0014.sh
> @@ -6,7 +6,7 @@
>  # by the RPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  formats="NV12M NV16M NV21M NV61M UYVY VYUY YUV420M YUV422M YUV444M YVU420M
> YVU422M YVU444M YUYV YVYU" diff --git a/tests/vsp-unit-test-0015.sh
> b/tests/vsp-unit-test-0015.sh index 381853721892..831817895589 100755
> --- a/tests/vsp-unit-test-0015.sh
> +++ b/tests/vsp-unit-test-0015.sh
> @@ -8,7 +8,7 @@
>  # carefully before putting it into practical use.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 sru wpf.0"
>  formats="RGB24 YUV444M"
> diff --git a/tests/vsp-unit-test-0016.sh b/tests/vsp-unit-test-0016.sh
> index f4a1508b0ad6..69a1099cd375 100755
> --- a/tests/vsp-unit-test-0016.sh
> +++ b/tests/vsp-unit-test-0016.sh
> @@ -5,7 +5,7 @@
>  # with image partitioning by inserting a UDS in the pipeline.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 uds wpf.0 wpf.0[control:'Vertical+Flip']"
>  optional_features="wpf.0[control:'Horizontal+Flip']
> wpf.0[control:'Rotate']" diff --git a/tests/vsp-unit-test-0017.sh
> b/tests/vsp-unit-test-0017.sh index 6034141ee0bb..26cf4af68fca 100755
> --- a/tests/vsp-unit-test-0017.sh
> +++ b/tests/vsp-unit-test-0017.sh
> @@ -9,7 +9,7 @@
>  # formats on the input and output.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 hst wpf.0"
>  formats="HSV24 HSV32"
> diff --git a/tests/vsp-unit-test-0018.sh b/tests/vsp-unit-test-0018.sh
> index 9d692cfc6194..015555cd2f0f 100755
> --- a/tests/vsp-unit-test-0018.sh
> +++ b/tests/vsp-unit-test-0018.sh
> @@ -5,7 +5,7 @@
>  # cropping windows.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
> diff --git a/tests/vsp-unit-test-0019.sh b/tests/vsp-unit-test-0019.sh
> index 7e8b255fe881..ab20733ce0ac 100755
> --- a/tests/vsp-unit-test-0019.sh
> +++ b/tests/vsp-unit-test-0019.sh
> @@ -11,7 +11,7 @@
>  # test can be easily extended to try further formats if needed in the
> future. #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
> 
> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> index db383b53fa6a..91f6b167f22e 100755
> --- a/tests/vsp-unit-test-0020.sh
> +++ b/tests/vsp-unit-test-0020.sh
> @@ -8,7 +8,7 @@
>  # still successful even with a suspend resume cycle in the middle of the
> test. #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
> 
> diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
> index 931f4569a808..5e05faac0f5a 100755
> --- a/tests/vsp-unit-test-0021.sh
> +++ b/tests/vsp-unit-test-0021.sh
> @@ -8,7 +8,7 @@
>  # by the WPF.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
>  formats="RGB332 ARGB555 XRGB555 RGB565 BGR24 RGB24 ABGR32 ARGB32 XBGR32
> XRGB32" diff --git a/tests/vsp-unit-test-0022.sh
> b/tests/vsp-unit-test-0022.sh index d161c13a91fa..fd9ea3258de2 100755
> --- a/tests/vsp-unit-test-0022.sh
> +++ b/tests/vsp-unit-test-0022.sh
> @@ -7,7 +7,7 @@
>  # duration pipeline lifetime while we stress the system.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="rpf.0 wpf.0"
> 
> diff --git a/tests/vsp-unit-test-0023.sh b/tests/vsp-unit-test-0023.sh
> index 0c61a5e80d1f..371fbea84f3e 100755
> --- a/tests/vsp-unit-test-0023.sh
> +++ b/tests/vsp-unit-test-0023.sh
> @@ -5,7 +5,7 @@
>  # with the HGT hooked up at the HST output.
>  #
> 
> -source vsp-lib.sh
> +. ./vsp-lib.sh
> 
>  features="hgt hsi hst rpf.0 wpf.0"


-- 
Regards,

Laurent Pinchart
