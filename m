Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:18609 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932233AbdBVMYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2017 07:24:02 -0500
Message-ID: <58AD82DE.1040806@jinso.co.jp>
Date: Wed, 22 Feb 2017 21:23:58 +0900
From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: DongCV <cv-dong@jinso.co.jp>,
        Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
References: <1484558970996626000058af@nat.cybozu.com> <1952286.6MMkHMyL63@avalon> <58A6D549.5000808@jinso.co.jp> <2653919.pRB2KAMlVt@avalon>
In-Reply-To: <2653919.pRB2KAMlVt@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent,

I am sorry for the late reply!.


>>> I've investigated the problem further here now that I'm back home with
>>> access to my Lager board, but have been unable to reproduce it even by
>>> testing all sync signal polarities.
>>>
>>> First of all, the "CMA enabled" kernel configuration file attached to a
>>> previous e-mail in this series indeed enables CMA, but doesn't enable CMA
>>> usage for DMA buffers. You need to additionally set
>>>
>>> CONFIG_DMA_CMA=y
>>> CONFIG_CMA_SIZE_MBYTES=128
>>>
>>> The amount of CMA memory to reserve can vary depending on the tests you
>>> perform. The larger the resolutions and the number of buffers are, the
>>> more
>>> memory you will need. 128MB should be a safe bet for most cases. Feel free
>>> to reduce that if you need to use a lot of memory outside of CMA, or
>>> increase it if you run into buffer allocation failures with multimedia
>>> devices (DU, VIN, VSP, ...). You can then let the HDMI cable plugged at
>>> all time and you should not get framebuffer allocation failures when
>>> booting the board with the cable plugged in.
>>>
>>> Then, I tried to modify the H/V sync polarities by using different video
>>> modes. If you look at the output of "modetest -M rcar-du", you should get
>>> a
>>> list of modes similar to the following for the HDMI output.
>>>
>>> 1440x900  60 1440 1520 1672 1904  900  903  909  934 flags: nhsync, pvsync
>>> 1280x1024 75 1280 1296 1440 1688 1024 1025 1028 1066 flags: phsync, pvsync
>>> 1280x1024 60 1280 1328 1440 1688 1024 1025 1028 1066 flags: phsync, pvsync
>>> 1440x900  75 1440 1536 1688 1936  900  903  909  942 flags: nhsync, pvsync
>>> 1280x800  60 1280 1328 1360 1440  800  803  809  823 flags: phsync, nvsync
>>> 1152x864  75 1152 1216 1344 1600  864  865  868  900 flags: phsync, pvsync
>>> 1024x768  75 1024 1040 1136 1312  768  769  772  800 flags: phsync, pvsync
>>> 1024x768  70 1024 1048 1184 1328  768  771  777  806 flags: nhsync, nvsync
>>> 1024x768  60 1024 1048 1184 1344  768  771  777  806 flags: nhsync, nvsync
>>> 832x624   75  832  864  928 1152  624  625  628  667 flags: nhsync, nvsync
>>> 800x600   75  800  816  896 1056  600  601  604  625 flags: phsync, pvsync
>>> 800x600   72  800  856  976 1040  600  637  643  666 flags: phsync, pvsync
>>> 800x600   60  800  840  968 1056  600  601  605  628 flags: phsync, pvsync
>>> 800x600   56  800  824  896 1024  600  601  603  625 flags: phsync, pvsync
>>> 640x480   75  640  656  720  840  480  481  484  500 flags: nhsync, nvsync
>>> 640x480   73  640  664  704  832  480  489  492  520 flags: nhsync, nvsync
>>> 640x480   67  640  704  768  864  480  483  486  525 flags: nhsync, nvsync
>>> 640x480   60  640  656  752  800  480  490  492  525 flags: nhsync, nvsync
>>> 720x400   70  720  738  846  900  400  412  414  449 flags: nhsync, pvsync
>>>
>>> Each mode has a defined horizontal and vertical polarity. If you pick your
>>> modes carefully you will be able to test all four combinations of
>>> polarities. I tried them all, and couldn't reproduce the reported problem
>>> with the test procedure that Dong specified.
>>>
>>> The easiest way to select a video mode for the fbdev compatibility layer
>>> is to specify it as the default mode on the kernel command line using the
>>> video= argument. The mode value is in the form of
>>> <width>x<height>@<refresh rate>. For instance, to select the 1024x768
>>> 75Hz mode, simply add
>>>
>>> 	video=1024x768@75
>>>
>>> to the kernel command line arguments (there are multiple ways to do so
>>> depending on how you configured your boot loader, I personally like to
>>> modify the bootargs value in the .dts file for the board).
>>>
>>> Could you please check if the problem occurs with all video modes
>>> supported by your HDMI monitor or with some of them only ?
>> We have tried to configure our test environment based on your
>> explanation, then tested it again.
>> But It didn't work. (we tried all of video parameters
>> <width>x<height>@<refresh rate> we have )
>> And we tried to confirm the issue on Simon's tree of renesas-backport
>> bsp v3.10.31-rcar-gen2-1.9.9.
>> It worked with the same test method.
>>
>> Did you check the issue on Upstream mainline version? or your own tree?
> I tested both my own tree and mainline v4.10-rc2.
>
>> Could you attach your config file?
>> I was wondering that your config and ours might be different.
> Sure. The configuration is based on the CONFIG_CMA_ENABLE.txt sent by Dong in
> this mail thread, with the following changes.
>
> --- CONFIG_CMA_ENABLE.txt 2017-02-17 15:21:57.974816277 +0200
> +++ .config  2017-02-17 15:20:31.618818828 +0200
> @@ -872,7 +872,17 @@
>   CONFIG_REGMAP_IRQ=y
>   CONFIG_DMA_SHARED_BUFFER=y
>   # CONFIG_DMA_FENCE_TRACE is not set
> -# CONFIG_DMA_CMA is not set
> +CONFIG_DMA_CMA=y
> +
> +#
> +# Default contiguous memory area size:
> +#
> +CONFIG_CMA_SIZE_MBYTES=128
> +CONFIG_CMA_SIZE_SEL_MBYTES=y
> +# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> +# CONFIG_CMA_SIZE_SEL_MIN is not set
> +# CONFIG_CMA_SIZE_SEL_MAX is not set
> +CONFIG_CMA_ALIGNMENT=8
>   
>   #
>   # Bus devices
>
Thanks for your config file.
We have tested it on our test environments and using many difference 
options of video parameters.
But It still didn't work.
Could you show me your rootfs's name and version?.

Thank you!.
Jinso/Hiep.
