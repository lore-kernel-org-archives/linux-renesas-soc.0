Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:36157 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932566AbeCMK5m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 06:57:42 -0400
Received: by mail-wr0-f195.google.com with SMTP id d10so8846940wrf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 03:57:41 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 1/3] nvram: at24c: remove doubled prefix for
 ERR
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Michael Davidsaver <mdavidsaver@gmail.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-2-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1bf57371-c1f5-6d5f-716f-8fd00cb9675b@amsat.org>
Date: Tue, 13 Mar 2018 11:57:39 +0100
MIME-Version: 1.0
In-Reply-To: <20180312214230.17561-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 03/12/2018 10:42 PM, Wolfram Sang wrote:
> The ERR macro already has the TYPE_AT24C_EE prefix, no need to repeat in
> the error message.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index 5494351976..8507516b7e 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -60,8 +60,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>          if (ee->blk && ee->changed) {
>              int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
>              if (len != ee->rsize) {
> -                ERR(TYPE_AT24C_EE
> -                        " : failed to write backing file\n");
> +                ERR("failed to write backing file\n");

printf/fprintf are deprecated, since you are modifying this file can you
use a newer API, "qemu/error-report.h" for example.

>              }
>              DPRINTK("Wrote to backing file\n");

DPRINTK() can be converted to tracepoint.

>          }
> @@ -127,7 +126,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>          int64_t len = blk_getlength(ee->blk);
>  
>          if (len != ee->rsize) {
> -            ERR(TYPE_AT24C_EE " : Backing file size %lu != %u\n",
> +            ERR("Backing file size %lu != %u\n",
>                      (unsigned long)len, (unsigned)ee->rsize);
>              exit(1);
>          }
> @@ -135,8 +134,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>          if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
>                           BLK_PERM_ALL, &error_fatal) < 0)
>          {
> -            ERR(TYPE_AT24C_EE
> -                    " : Backing file incorrect permission\n");
> +            ERR("Backing file incorrect permission\n");
>              exit(1);
>          }
>      }
> @@ -158,8 +156,7 @@ void at24c_eeprom_reset(DeviceState *state)
>          int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
>  
>          if (len != ee->rsize) {
> -            ERR(TYPE_AT24C_EE
> -                    " : Failed initial sync with backing file\n");
> +            ERR("Failed initial sync with backing file\n");
>          }
>          DPRINTK("Reset read backing file\n");
>      }
> 
