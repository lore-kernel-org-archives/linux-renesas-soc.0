Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:44489 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932133AbeEHWjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 18:39:54 -0400
Date: Tue, 8 May 2018 15:39:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: trivial@kernel.org, linux-renesas-soc@vger.kernel.org,
        Ville Syrjala <syrjala@sci.fi>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] input: ati_remote2: fix typo 'can by' to 'can be'
Message-ID: <20180508223950.GD129015@dtor-ws>
References: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
 <20180506112404.24872-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180506112404.24872-6-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 06, 2018 at 01:23:49PM +0200, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

> ---
>  drivers/input/misc/ati_remote2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
> index ded5b84e336dae..d8fd58fdf05086 100644
> --- a/drivers/input/misc/ati_remote2.c
> +++ b/drivers/input/misc/ati_remote2.c
> @@ -22,7 +22,7 @@ MODULE_LICENSE("GPL");
>  /*
>   * ATI Remote Wonder II Channel Configuration
>   *
> - * The remote control can by assigned one of sixteen "channels" in order to facilitate
> + * The remote control can be assigned one of sixteen "channels" in order to facilitate
>   * the use of multiple remote controls within range of each other.
>   * A remote's "channel" may be altered by pressing and holding the "PC" button for
>   * approximately 3 seconds, after which the button will slowly flash the count of the
> -- 
> 2.11.0
> 

-- 
Dmitry
