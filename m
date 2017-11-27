Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:44250 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751537AbdK0TGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Nov 2017 14:06:36 -0500
Received: by mail-oi0-f49.google.com with SMTP id y71so12482058oia.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2017 11:06:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171127180528.rg5imhfthbso477s@ninjato>
References: <1510839994-12473-1-git-send-email-geert+renesas@glider.be> <20171127180528.rg5imhfthbso477s@ninjato>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Nov 2017 20:06:35 +0100
Message-ID: <CAMRc=MdDMKuEXx+WqLmJsUY0=jiubiQ2CFM6Hhd-tyU=m1cw9g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: eeprom: Add Renesas R1EX24128
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

2017-11-27 19:05 GMT+01:00 Wolfram Sang <wsa@the-dreams.de>:
> Bartosz,
>
>>  Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 +-
>
> I just noticed this file is missing in the AT24 entry in MAINTAINERS. I
> wanted to prepare a patch for that but then I was wondering if the name
> "eeprom.txt" is really suitable? I have doubts. Would "at24.txt" be a
> better name maybe? Rob?
>
> Kind regards,
>
>    Wolfram
>

Yes, it definitely should be called at24.txt - especially that we have
the legacy eeprom module in drivers/misc/eeprom/eeprom.c which has
nothing to do with the bindings in eeprom.txt.

Acked-in-advance-by: Bartosz Golaszewski <brgl@bgdev.pl>

Thanks,
Bartosz
