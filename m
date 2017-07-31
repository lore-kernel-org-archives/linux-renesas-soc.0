Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:33684 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751046AbdGaQRj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 12:17:39 -0400
Received: by mail-io0-f174.google.com with SMTP id j32so92320757iod.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Jul 2017 09:17:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170731153009.xkjknygpmckv2pfp@ninjato>
References: <20170615185418.13980-1-javier@dowhile0.org> <20170731153009.xkjknygpmckv2pfp@ninjato>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Mon, 31 Jul 2017 18:17:38 +0200
Message-ID: <CABxcv=mdbE0QGjoi3aLzxRqM3-MbkQ_Ai6fShcGVUGSNNqqrqw@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 00/16] eeprom: at24: Add OF device ID table
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, Florian Larysch <fl@n621.de>,
        David Lechner <david@lechnology.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>,
        Simon Horman <horms@verge.net.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Scott Wood <oss@buserror.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joachim Eastwood <manabian@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <kernel@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Wolfram,

On Mon, Jul 31, 2017 at 5:30 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>
>> Patches can be applied independently since the DTS changes without driver
>> changes are no-op and the OF table won't be used without the DTS changes.
>
> But there is a dependency, no? If I apply the driver patch,
> non-converted device trees will not find their eeproms anymore. So, I

I don't think that's correct. If you apply this patch before the DTS
changes, the driver will still match using the I2C device ID table
like it has been doing it until today.

IOW, this is what will happen:

1- an OF device is registered with the wrong compatible (not found in
the OF table)
2- the I2C core strips the vendor part and fills the struct i2c_client
.name with the device part.
3- i2c_device_match() will be called since a new device has been registered
4- i2c_of_match_device() will fail because there's no OF entry that
matches the device compatible
5- the I2C core fallbacks to i2c_match_id() and matches using the I2C
device ID table.

So no noticeable difference AFAICT in that case.

Best regards,
Javier
