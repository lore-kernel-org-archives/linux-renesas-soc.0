Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36842 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932566AbeCMK77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 06:59:59 -0400
Received: by mail-wr0-f196.google.com with SMTP id d10so8868412wrf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 03:59:58 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 2/3] nvram: at24c: prevent segfault by
 checking "rom-size"
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Michael Davidsaver <mdavidsaver@gmail.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-3-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6e49f6a-5c78-6628-d530-cfd47b566296@amsat.org>
Date: Tue, 13 Mar 2018 11:59:56 +0100
MIME-Version: 1.0
In-Reply-To: <20180312214230.17561-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/12/2018 10:42 PM, Wolfram Sang wrote:
> The value for "rom-size" is used as a divisor, so it must not be 0 or it
> will segfault. A size of 0 wouldn't make sense as well.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 8507516b7e..d82710e1df 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -120,6 +120,11 @@ int at24c_eeprom_init(I2CSlave *i2c)
>  {
>      EEPROMState *ee = AT24C_EE(i2c);
>  
> +    if (!ee->rsize) {
> +        ERR("rom-size not allowed to be 0\n");

This might be more useful:

           error_report("Minimum rom-size is %u", AT24C_ROMSIZE_MIN);

> +        exit(1);
> +    }
> +
>      ee->mem = g_malloc0(ee->rsize);
>  
>      if (ee->blk) {
> 
