Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34494 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752459AbdILRN4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 13:13:56 -0400
Received: by mail-lf0-f54.google.com with SMTP id l196so28088505lfl.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 10:13:56 -0700 (PDT)
Subject: Re: [PATCH repost v2] serial: sh-sci: document R8A77970 bindings
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20170901221519.704978317@cogentembedded.com>
 <20170912164714.3x5hjmkasdjhninp@rob-hp-laptop>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <646bfb14-b768-3c3b-7512-4abdfae5a3f9@cogentembedded.com>
Date: Tue, 12 Sep 2017 20:13:52 +0300
MIME-Version: 1.0
In-Reply-To: <20170912164714.3x5hjmkasdjhninp@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 09/12/2017 07:47 PM, Rob Herring wrote:

>> R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible SCIF and HSCIF
>> ports, so document the SoC specific bindings.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'tty-next' branch of GregKH's 'tty.git' repo.
> 
> So I guess you want Greg to apply because it doesn't apply to my tree.
> It's only a binding change, so not really any reason Greg has to take
> it.

    The MAINTAINERS file explicitly lists 
Documentation/devicetree/bindings/serial/ as Greg's area.

> Acked-by: Rob Herring <robh@kernel.org>

   Thanks!

[...]

> Rob

MBR, Seregi
