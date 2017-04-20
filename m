Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33572 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S971144AbdDTQ05 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Apr 2017 12:26:57 -0400
Received: by mail-lf0-f41.google.com with SMTP id 88so31886189lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Apr 2017 09:26:57 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
To: Rob Herring <robh@kernel.org>
References: <20170413201932.890107963@cogentembedded.com>
 <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <53d77809-c448-443a-6e41-6258253d98eb@cogentembedded.com>
Date: Thu, 20 Apr 2017 19:26:53 +0300
MIME-Version: 1.0
In-Reply-To: <20170419224646.wwjerpgnidvk4fkh@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/20/2017 01:46 AM, Rob Herring wrote:

>> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
>> however  it doesn't have several automotive specific peripherals.
>
> Is a single space between words really so hard for you? You've been told
> to write proper sentences multiple times.

    Nobody else but suffer from "double spaces". I just failed to remember 
that once you are included into the patch addresses (I forget to update the 
bindings in v1), you'll suffer from it again...

> Yes, kernel developers suffer from OCD. Sorry.

    Obsessive-compulsive disorder, you mean? I feel your pain then... B-)

>> Annotate all the items that only exist on the R-Car SoCs and only
>> supply the pin groups/functions existing on a given SoC (that required
>> splitting  of the AVB function)...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
>> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
>>
>> Changes in version 2:
>> - fixed indentation to use tabs instead of spaces;
>> - updated the PFC bindings.
>>
>>  Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt |    1
>
> But given it's a one line DT change:
>
> Acked-by: Rob Herring <robh@kernel.org>

   Thank you!

MBR, Sergei
