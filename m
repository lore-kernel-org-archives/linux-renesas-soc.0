Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:33146 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754492AbdGJQEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 12:04:09 -0400
Received: by mail-ua0-f181.google.com with SMTP id w19so57664068uac.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2017 09:04:09 -0700 (PDT)
Subject: Re: [PATCH 1/6] arm64: dts: renesas: ulcb: Enable I2C4
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1499393396-11594-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdVPNoCZz3fiqXOQ6Rx_jzAa4-rDAE9XD3jZH-mkZJmUhg@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <df0aacd3-7778-998e-f63c-3667553c3fe0@cogentembedded.com>
Date: Mon, 10 Jul 2017 19:04:04 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVPNoCZz3fiqXOQ6Rx_jzAa4-rDAE9XD3jZH-mkZJmUhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for review!

On 10.07.2017 11:20, Geert Uytterhoeven wrote:
> On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
>>
>> This enables I2C4 for ULCB board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
>> @@ -189,6 +189,12 @@
>>          };
>>   };
>>
>> +&i2c4 {
>> +       status = "okay";
>> +
>> +       clock-frequency = <400000>;
> Is this a bus limitation, or a limitation for the VC6 that's added in a later
> patch?
Yes, IDT VC5 clock generator supports up to 400kHz.

I've explicitly set 400kHz as default since the documentation says that 
the default value is 100kHz if 'clock-frequency' not set:
Documentation/devicetree/bindings/i2c/i2c-rcar.txt

Regards,
Vladimir
