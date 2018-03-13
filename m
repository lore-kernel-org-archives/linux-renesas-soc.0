Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:41826 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932627AbeCMKx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 06:53:58 -0400
Received: by mail-wr0-f195.google.com with SMTP id f14so21268977wre.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 03:53:58 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 3/3] nvram: at24c: use a sane default for
 "rom-size"
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Michael Davidsaver <mdavidsaver@gmail.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
 <20180312214230.17561-4-wsa+renesas@sang-engineering.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5108cc9b-9fb9-d202-d4bc-a5c1dd4d4f76@amsat.org>
Date: Tue, 13 Mar 2018 11:53:55 +0100
MIME-Version: 1.0
In-Reply-To: <20180312214230.17561-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 03/12/2018 10:42 PM, Wolfram Sang wrote:
> 0 as "rom-size" doesn't make much sense, let's use the smallest 24cXX
> which has 128 byte.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  hw/nvram/eeprom_at24c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index d82710e1df..de988f8d07 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -168,7 +168,7 @@ void at24c_eeprom_reset(DeviceState *state)
>  }
>  
>  static Property at24c_eeprom_props[] = {
> -    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
> +    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 128),

This patch should goes before your 2/3 in your series.

Can you add a #define for this value? Such AT24C_ROMSIZE_MIN.

With a #define you can add:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
>      DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
>      DEFINE_PROP_END_OF_LIST()
> 
