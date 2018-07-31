Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:46935 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbeGaSSW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 14:18:22 -0400
Received: by mail-oi0-f66.google.com with SMTP id y207-v6so29120273oie.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Jul 2018 09:37:15 -0700 (PDT)
Subject: Re: [PATCH QEMU] hw/char/sh_serial: Add timeout handling to unbreak
 serial input
To: Ulrich Hecht <uli@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peter Maydell <peter.maydell@linaro.org>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20180730130234.30020-1-geert+renesas@glider.be>
 <1115027626.150336.1532963923061@webmail.strato.com>
From: Rob Landley <rob@landley.net>
Message-ID: <97622558-a520-6ab2-b61f-8038ae61b451@landley.net>
Date: Tue, 31 Jul 2018 11:36:46 -0500
MIME-Version: 1.0
In-Reply-To: <1115027626.150336.1532963923061@webmail.strato.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/30/2018 10:18 AM, Ulrich Hecht wrote:>> On July 30, 2018 at 3:02 PM Geert
Uytterhoeven <geert+renesas@glider.be> wrote:
>> Fix this by adding basic timeout handling.  As the QEMU SCIF emulation
>> ignores any serial speed programming, the timeout value used conforms to
>> a default speed of 9600 bps, which is fine for any interative console.
>>
>> Reported-by: Rob Landley <rob@landley.net>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Works for me, kernel 4.18-rc7 for rts7751r2dplus.

Works for me too.

Tested-by: Rob Landley <rob@landley.net>

Rob
