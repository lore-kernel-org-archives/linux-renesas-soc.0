Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:28816 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752372AbeCOReA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 13:34:00 -0400
Date: Thu, 15 Mar 2018 19:33:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [Intel-gfx] [PATCH igt 5/8] tests/kms_plane_lowres: skip
 i915-specific tests on other platforms
Message-ID: <20180315173355.GX5453@intel.com>
References: <1521125144-28614-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1521125144-28614-6-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1521125144-28614-6-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 15, 2018 at 03:45:41PM +0100, Ulrich Hecht wrote:
> Add is_i915_device() requirement to tests using Intel-specific APIs.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  tests/kms_plane_lowres.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index d1e4b3c..8fc7654 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -270,6 +270,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
>  		igt_skip_on(pipe >= data->display.n_pipes);
>  
>  		igt_display_require_output_on_pipe(&data->display, pipe);
> +		igt_require(is_i915_device(data->drm_fd));

What's the i915 specific thing here? The tiling formats? You should
still be able to do the linear tests.

We probably want to utilize https://patchwork.freedesktop.org/patch/210341/
to skip any test that is trying to use an unsupported modifier. Looks
like I didn't account for drivers that don't support blobifiers.
Shouldn't be too difficult to fix that up though.

>  	}
>  
>  	igt_subtest_f("pipe-%s-tiling-none",
> -- 
> 2.7.4
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Ville Syrj�l�
Intel OTC
