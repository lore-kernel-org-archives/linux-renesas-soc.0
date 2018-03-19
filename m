Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35470 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934745AbeCSVvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 17:51:12 -0400
Subject: Re: [Qemu-devel] [PATCH v2 3/3] nvram: at24c: use standard error
 reporting
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        qemu-devel@nongnu.org
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
 <20180319213101.6100-4-wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From: Eric Blake <eblake@redhat.com>
Message-ID: <2071e85f-72b9-9fa5-e5d7-7faa41fb9074@redhat.com>
Date: Mon, 19 Mar 2018 16:51:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180319213101.6100-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/19/2018 04:31 PM, Wolfram Sang wrote:
> Replace the ERR macro with error_report() because fprintf is deprecated.
> This also fixes the prefix printed out twice.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   hw/nvram/eeprom_at24c.c | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 

> @@ -63,8 +61,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>           if (ee->blk && ee->changed) {
>               int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
>               if (len != ee->rsize) {
> -                ERR(TYPE_AT24C_EE
> -                        " : failed to write backing file\n");
> +                error_report("failed to write backing file\n");

Drop the \n here and elsewhere in your patch; error_report() already 
does that for you.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
