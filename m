Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/1] scripts: bin2png.sh: Fix POSIX shell compliance
Date: Wed, 22 Feb 2017 19:38:42 +0200
Message-ID: <30367151.ZUST0R0bSB@avalon>
In-Reply-To: <1487778763-10482-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <20170213141522.11545-1-laurent.pinchart@ideasonboard.com> <1487778763-10482-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Wednesday 22 Feb 2017 15:52:43 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> The string manipulations of the form ${VAR/search/replace} are not posix
> compliant. Use string deletion, and append instead.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by, applied and pushed.

> ---
>  scripts/bin2png.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/bin2png.sh b/scripts/bin2png.sh
> index 090f31fa992d..6422ee51bc33 100755
> --- a/scripts/bin2png.sh
> +++ b/scripts/bin2png.sh
> @@ -4,8 +4,8 @@ FILE=${1:-.}
> 
>  convert_image() {
>  	local file=$1
> -	local pnm=${file/%bin/pnm}
> -	local png=${file/%bin/png}
> +	local pnm=${file%bin}pnm
> +	local png=${file%bin}png
> 
>  	local format=$(echo $file | sed -e
> 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\1|' | tr '[:lower:]'
> '[:upper:]') local size=$(echo $file   | sed -e
> 's|.*-\([[:alnum:]]*\)-\([0-9]*x[0-9]*\).*.bin|\2|')

-- 
Regards,

Laurent Pinchart
