Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38997 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933689AbeCTApo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 20:45:44 -0400
Received: by mail-wr0-f193.google.com with SMTP id c24so8610287wrc.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 17:45:43 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] nvram: at24c: use a sane default for "rom-size"
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-3-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e1c19d1a-0d1b-f4b6-e255-649ab0349e2d@amsat.org>
Date: Tue, 20 Mar 2018 01:45:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180319213101.6100-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/19/2018 10:31 PM, Wolfram Sang wrote:
> 0 as "rom-size" will lead to an error message. Let's use the size of a
> small 24c01 which has 128 byte.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/nvram/eeprom_at24c.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index ccf78b25e4..ab1ef686e2 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -28,6 +28,9 @@
>  #define TYPE_AT24C_EE "at24c-eeprom"
>  #define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
>  
> +/* default is the size of a 24c01 EEPROM */
> +#define AT24C_ROMSIZE_DEFAULT 128
> +
>  typedef struct EEPROMState {
>      I2CSlave parent_obj;
>  
> @@ -171,7 +174,7 @@ void at24c_eeprom_reset(DeviceState *state)
>  }
>  
>  static Property at24c_eeprom_props[] = {
> -    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> +    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, AT24C_ROMSIZE_DEFAULT),
>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
>      DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
>      DEFINE_PROP_END_OF_LIST()
> 
