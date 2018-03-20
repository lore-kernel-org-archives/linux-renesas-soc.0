Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45722 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964906AbeCTAsn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 20:48:43 -0400
Received: by mail-wr0-f194.google.com with SMTP id h2so20396438wre.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 17:48:42 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] nvram: at24c: prevent segfault by checking
 "rom-size"
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-2-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3005cdd5-f3c4-a0c0-f6db-abc2b7bf759a@amsat.org>
Date: Tue, 20 Mar 2018 01:48:39 +0100
MIME-Version: 1.0
In-Reply-To: <20180319213101.6100-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/19/2018 10:30 PM, Wolfram Sang wrote:
> The value for "rom-size" is used as a divisor, so it must not be 0 or it
> will segfault. A size of 0 wouldn't make sense anyhow.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 22183f5360..ccf78b25e4 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -121,6 +121,11 @@ int at24c_eeprom_init(I2CSlave *i2c)
>  {
>      EEPROMState *ee = AT24C_EE(i2c);
>  
> +    if (!ee->rsize) {
> +        ERR("rom-size not allowed to be 0\n");

You can directly use error_report() in this patch.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        exit(1);
> +    }
> +
>      ee->mem = g_malloc0(ee->rsize);
>  
>      if (ee->blk) {
> 
