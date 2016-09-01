Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34563 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756930AbcIAVII (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 17:08:08 -0400
Received: by mail-lf0-f46.google.com with SMTP id p41so51449790lfi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 14:08:07 -0700 (PDT)
Subject: Re: [PATCH 1/3] ARM: dts: r7s72100: add ethernet clock to device tree
To: Chris Brandt <Chris.Brandt@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
 <aaf8c5de-a4f8-42e5-583d-c81a9d92edae@cogentembedded.com>
 <SG2PR06MB116534DAEDA31113AB14C46B8AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
Cc: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e277692a-8ea5-9ca7-bfe5-c9980ec7a858@cogentembedded.com>
Date: Thu, 1 Sep 2016 19:54:01 +0300
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB116534DAEDA31113AB14C46B8AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/01/2016 07:38 PM, Chris Brandt wrote:

>>    I'd add the MSTP7 clock node itself in the same patch...
>
> OK. I tried to look at previous commits to figure out what goes in what patch.

    There's no single approach here... but it was just that your patch subject 
doesn't seem to correspond well to what the patch does.

> Thanks.
>
> Chris

MBR, Sergei
