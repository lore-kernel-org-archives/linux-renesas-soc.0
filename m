Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 1/4] vsp-lib: Filter non-filesystem regular characters
Date: Sun, 12 Feb 2017 23:05:34 +0200
Message-ID: <29741271.i3UgzBgdjd@avalon>
In-Reply-To: <a6cd919063a1d5983be9dd24268881e23dc294aa.1486733302.git-series.kieran.bingham@ideasonboard.com>
References: <cover.eec601d2240d67bb1b1cbcb6d8485e49a40ffee3.1486733302.git-series.kieran.bingham@ideasonboard.com> <a6cd919063a1d5983be9dd24268881e23dc294aa.1486733302.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Friday 10 Feb 2017 13:30:05 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Parameters can contain characters not suited to use in filenames.
> 
> Add '=','(', and ')' to the filtering, and replace with '_'
> 
> This reduces extra escaping, and quoting when working with the output
> filenames of failed tests and VSP_KEEP_FRAMES=1

I agree that some characters can increase the difficulty of handling file 
names in scripts or on the command line by requiring escaping. I would prefer 
fixing the scripts, but I'll accept this patch on the ground that the 
information loss caused by replacing the =, ( and ) characters with _ will not 
adversely affect our tests. If that turns out not to be true anymore in the 
future I reserve the right to revert the patch and ask you to fix your scripts 
:-)

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 8f2755b57519..9e5e57b8c4ba 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -258,6 +258,9 @@ compare_frames() {
>  	local params=${args// /-}
>  	params=${params:+-$params}
>  	params=${params//\//_}
> +	params=${params//=/_}
> +	params=${params//(/_}
> +	params=${params//)/_}
>  	params=$in_fmt-$out_fmt-$size$params
> 
>  	if [ x$__vsp_pixel_perfect != xtrue ] ; then

-- 
Regards,

Laurent Pinchart
