Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f48.google.com ([209.85.213.48]:43062 "EHLO
        mail-vk0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751554AbdITOn2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 10:43:28 -0400
Received: by mail-vk0-f48.google.com with SMTP id h4so1568748vkg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2017 07:43:28 -0700 (PDT)
Subject: Re: [PATCH 03/18] arm64: dts: ulcb-kf: initial device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737322-22954-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXyWV52_kZNFGQzPpnAYowa0KZYodMAWusCX5Opj3a1iQ@mail.gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Message-ID: <95e3fe73-3c14-aa58-393e-62b41b568db1@cogentembedded.com>
Date: Wed, 20 Sep 2017 17:43:25 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXyWV52_kZNFGQzPpnAYowa0KZYodMAWusCX5Opj3a1iQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the review.

On 20.09.2017 15:20, Geert Uytterhoeven wrote:
> +};
>> +
>> +&hscif0 {
>> +       pinctrl-0 = <&hscif0_pins>;
>> +       pinctrl-names = "default";
>> +       uart-has-rtscts;
>> +
>> +       status = "okay";
> This serial port is driving Bluetooth and WiFi, right?
Yes.
> So I expect this node to gain a child node for that in the future, cfr.
> Documentation/devicetree/bindings/serial/slave-device.txt.
Got it.

-- 
Regards,
Vladimir
