Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:46784 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753381AbdKOQv4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 11:51:56 -0500
Received: by mail-lf0-f65.google.com with SMTP id k66so14941656lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 08:51:56 -0800 (PST)
Date: Wed, 15 Nov 2017 17:51:54 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH 3/3] vin-tests: Refactor mc_get_dev
Message-ID: <20171115165153.GI12677@bigcity.dyn.berto.se>
References: <1510756711-6488-1-git-send-email-kbingham@kernel.org>
 <1510756711-6488-4-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1510756711-6488-4-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thanks for your patch.

Unfortunately I experience some problems with this patch.

On 2017-11-15 14:38:31 +0000, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Rather that using shell parsing of each file when looking for a device
> node, use a combination of grep and sed to identify the device.
> 
> This is a remarkable speed optimisation for this code segment.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  scripts/vin-tests.sh | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
> index 7c81aa51c1c5..2e6214bc95e6 100644
> --- a/scripts/vin-tests.sh
> +++ b/scripts/vin-tests.sh
> @@ -99,17 +99,9 @@ mc_get_mdev() {
>  }
>  
>  mc_get_dev() {
> -    name=$1
> -    mdev=$(mc_get_mdev)
> -
> -    for dev in  /sys/class/video4linux/*; do
> -        if [[ "$(cat $dev/name)" == "$name" ]]; then
> -            basename $dev
> -            return 0
> -        fi
> -    done
> -
> -    error "Can't find device"
> +    name="$1"
> +    grep -l "$name" /sys/class/video4linux/video*/name | \
> +	    sed 's#.*video4linux\(.*\)/name#/dev\1#g'

The only user of mc_get_dev() is the set-edid utility, which uses it to 
find the adv748x HDMI subdevice (adv748x 4-0070 hdmi) so it can program 
the EDID. I had to change search path above to 
/sys/class/video4linux/*/name to also searches in v4l-subdevX 
directories to find thatt device.

Also the return value changes from 'v4l-subdev42' to /dev/v4l-subdev42' 
so the set-edid tool needed a small update to handle that :-)

I have applied this patch as-is, and then a followup which takes care of 
the above. Out of curiosity, are you working on any new tests which uses 
mc_get_dev()?

>  }
>  
>  mc_log() {
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
