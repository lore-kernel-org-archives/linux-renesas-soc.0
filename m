Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:35682 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751120AbcIMFM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2016 01:12:58 -0400
Message-ID: <57D78AD6.2090408@jinso.co.jp>
Date: Tue, 13 Sep 2016 14:12:54 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: =?UTF-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
        <niklas.soderlund@ragnatech.se>
CC: laurent.pinchart+renesas@ideasonboard.com,
        duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com, harunaga <nx-truong@jinso.co.jp>,
        =?UTF-8?B?5Lq644K977yJ44OJ44Oz44GV44KT?= <cv-dong@jinso.co.jp>,
        Na Hoan <na-hoan@jit.vn>
Subject: Re: GEN2: Initialization of VIN failed at upstream v4.8-rc2
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp> <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <57D66DEC.4090607@jinso.co.jp> <57D6767D.2040402@jinso.co.jp> <20160912110929.GQ27014@bigcity.dyn.berto.se>
In-Reply-To: <20160912110929.GQ27014@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,


On 09/12/2016 08:09 PM, Niklas Söderlund wrote:
> Hi Hiep,
>
> On 2016-09-12 18:33:49 +0900, Hiep Cao Minh wrote:
>> Hi Niklas
>>
>> As you know the information about initialization of VIN failed at upstream
>> v4.8-rc2
>>   from the report of "The failure summary report of GEN2 for Linux v4.8-rc2".
>> "…
>> [ 5.589485] [<c0549114>] (of_node_put) from [<c0510558>]
>> (rcar_vin_probe+0x1c4/0x2d0)
>> [ 5.612949] [<c0510394>] (rcar_vin_probe) from [<c040dd60>]
>> (platform_drv_probe+0x58/0xa4)
>> …
>> [ 5.942909] [<c040e6f0>] (__platform_driver_register) from [<c091fa58>]
>> (rcar_vin_driver_init+0x18/0x20)
>> [ 5.971318] [<c091fa40>] (rcar_vin_driver_init) from [<c0900e44>]
>> (do_one_initcall+0xb4/0x164) ...
>> ...”
>>
>> I have found the patch that causing of this issue:
>> "f00add9 [media] rcar-vin: add Renesas R-Car VIN driver"
>>
>> Please have a look at this issue when you have time.
> Thanks for finding this. I found out about this issue (which is only
> printed if some OF debug option is enabled) after the patch was picked
> up.
>
> The issue is already fixed and picked up in the media tree, see 83fba2c
> ([media] rcar-vin: rework how subdevice is found and bound).
Thanks for your fixed patch, We'll try it on our environment.

Jinso/Linux Team.
Hiep.
