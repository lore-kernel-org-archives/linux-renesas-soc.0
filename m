Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37298 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964906AbeCTAtP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 20:49:15 -0400
Received: by mail-wm0-f66.google.com with SMTP id 139so302133wmn.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 17:49:15 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] nvram: at24c: use standard error reporting
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-4-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eed94f45-6c1b-1192-3542-8c2380fa2062@amsat.org>
Date: Tue, 20 Mar 2018 01:49:12 +0100
MIME-Version: 1.0
In-Reply-To: <20180319213101.6100-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/19/2018 10:31 PM, Wolfram Sang wrote:
> Replace the ERR macro with error_report() because fprintf is deprecated.
> This also fixes the prefix printed out twice.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index ab1ef686e2..1560c9a46b 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -13,6 +13,7 @@
>  #include "hw/hw.h"
>  #include "hw/i2c/i2c.h"
>  #include "sysemu/block-backend.h"
> +#include "qemu/error-report.h"
>  
>  /* #define DEBUG_AT24C */
>  
> @@ -22,9 +23,6 @@
>  #define DPRINTK(FMT, ...) do {} while (0)
>  #endif
>  
> -#define ERR(FMT, ...) fprintf(stderr, TYPE_AT24C_EE " : " FMT, \
> -                            ## __VA_ARGS__)
> -
>  #define TYPE_AT24C_EE "at24c-eeprom"
>  #define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
>  
> @@ -63,8 +61,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>          if (ee->blk && ee->changed) {
>              int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
>              if (len != ee->rsize) {
> -                ERR(TYPE_AT24C_EE
> -                        " : failed to write backing file\n");
> +                error_report("failed to write backing file\n");
>              }
>              DPRINTK("Wrote to backing file\n");
>          }
> @@ -125,7 +122,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>      EEPROMState *ee = AT24C_EE(i2c);
>  
>      if (!ee->rsize) {
> -        ERR("rom-size not allowed to be 0\n");
> +        error_report("rom-size not allowed to be 0\n");
>          exit(1);
>      }
>  
> @@ -135,7 +132,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>          int64_t len = blk_getlength(ee->blk);
>  
>          if (len != ee->rsize) {
> -            ERR(TYPE_AT24C_EE " : Backing file size %lu != %u\n",
> +            error_report("Backing file size %lu != %u\n",
>                      (unsigned long)len, (unsigned)ee->rsize);
>              exit(1);
>          }
> @@ -143,8 +140,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
>          if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
>                           BLK_PERM_ALL, &error_fatal) < 0)
>          {
> -            ERR(TYPE_AT24C_EE
> -                    " : Backing file incorrect permission\n");
> +            error_report("Backing file incorrect permission\n");
>              exit(1);
>          }
>      }
> @@ -166,8 +162,7 @@ void at24c_eeprom_reset(DeviceState *state)
>          int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
>  
>          if (len != ee->rsize) {
> -            ERR(TYPE_AT24C_EE
> -                    " : Failed initial sync with backing file\n");
> +            error_report("Failed initial sync with backing file\n");
>          }
>          DPRINTK("Reset read backing file\n");
>      }
> 

Without '\n':
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
