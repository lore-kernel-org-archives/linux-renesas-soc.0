Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:34631 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754860AbdIGMGr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 08:06:47 -0400
Received: by mail-io0-f176.google.com with SMTP id b142so3660411ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Sep 2017 05:06:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170905182750.4343-1-wsa+renesas@sang-engineering.com>
References: <20170905182750.4343-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Sep 2017 14:06:46 +0200
Message-ID: <CAPDyKFoYZqm9b90Nmudzgf7ApN0-hCCKocX38Dw7i_Zb7ZW3iQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: fix typo after MMC_DEBUG move
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5 September 2017 at 20:27, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> MMC_DEBUG was moved and one letter got strangely capitalized.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for fixes!

Kind regards
Uffe

> ---
>
> based on mmc/next
>
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 02179ed2a40d7a..8c15637178ff3c 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -5,7 +5,7 @@
>  comment "MMC/SD/SDIO Host Controller Drivers"
>
>  config MMC_DEBUG
> -       bool "MMC host drivers debugginG"
> +       bool "MMC host drivers debugging"
>         depends on MMC != n
>         help
>           This is an option for use by developers; most people should
> --
> 2.11.0
>
