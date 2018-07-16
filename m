Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:37822 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbeGPJnW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 05:43:22 -0400
MIME-Version: 1.0
In-Reply-To: <20180716075325.y7jtwyqxwerdmfy3@verge.net.au>
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
 <c78f1228-afb0-54cf-5d9e-5c812b678de3@cogentembedded.com> <20180614072426.vq42mmb3gsmv6z5k@verge.net.au>
 <20180716075325.y7jtwyqxwerdmfy3@verge.net.au>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Mon, 16 Jul 2018 11:16:53 +0200
Message-ID: <CAO3366wzXc+KY2uMVp5FGS9RyGyaFgktWS__kSTdu3AAWVxZKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: condor/v3hsk: add
 DU/LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 16, 2018 at 9:53 AM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Jun 14, 2018 at 09:24:27AM +0200, Simon Horman wrote:
>> On Wed, Jun 13, 2018 at 11:12:40PM +0300, Sergei Shtylyov wrote:
>> > Define the Condor/V3HSK board dependent parts of the DU and  LVDS device
>> > nodes. Also add the device nodes for Thine THC63LVD1024 LVDS decoder and
>> > Analog Devices ADV7511W HDMI transmitter...
>> >
>> > Based on the original (and large) patch by Vladimir Barinov.
>> >
>> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> >
>> > ---
>> > Changes in version 2:
>> > - added the V3HSK DT update, reworded the description, renamed the patch;
>> > - added a space between the HDMI node name and a brace.
>> >
>> >  arch/arm64/boot/dts/renesas/r8a77980-condor.dts |  106 +++++++++++++++++++++
>> >  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts  |  120 ++++++++++++++++++++++++
>>
>> Laurent, could you review this?
>
> Ping

For the Condor part:

Reviewed-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Unfortunately, I do not have documentation for the other board.

CU
Uli
