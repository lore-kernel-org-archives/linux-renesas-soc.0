Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:52156 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751423AbdJFCk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 22:40:58 -0400
Received: by mail-lf0-f54.google.com with SMTP id m142so15080634lfg.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Oct 2017 19:40:58 -0700 (PDT)
Subject: Re: [PATCH v2 14/18] arm64: dts: ulcb-kf: enable PCA9539 on I2C2
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1505398760-4774-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWvhm_bbLz8cBqPWC-nXrTr6jw4cBV1A_WAsvi6DzsR0w@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <377d7b16-15be-a488-6187-4c57b8b57d6e@cogentembedded.com>
Date: Fri, 6 Oct 2017 05:40:55 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWvhm_bbLz8cBqPWC-nXrTr6jw4cBV1A_WAsvi6DzsR0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 20.09.2017 16:44, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 14, 2017 at 4:19 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
>> This supports PCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
>> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
>> @@ -48,6 +48,28 @@
>>          status = "okay";
>>   };
>>
>> +&i2c2 {
>> +       gpio_exp_74: gpio@74 {
>> +               compatible = "nxp,pca9539";
> According to the schematics, this is the TI TCA9539, an enhanced version
> of the NXP PCA9539. So I'd expect "ti,tca9539".
>
> However, using the latter may not work (I didn't try), as pca953x_id[]
> lists both parts, while pca953x_dt_ids[] lists only the NXP part number.
It works with "ti,tca9539"

-- 
Regards,
Vladimir
