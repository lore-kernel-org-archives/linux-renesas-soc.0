Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36017 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751326AbdKWHnT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Nov 2017 02:43:19 -0500
MIME-Version: 1.0
In-Reply-To: <20171122181045.5pstmikwp43idts5@verge.net.au>
References: <1510915289-15059-1-git-send-email-ulrich.hecht+renesas@gmail.com> <20171122181045.5pstmikwp43idts5@verge.net.au>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Thu, 23 Nov 2017 08:43:18 +0100
Message-ID: <CAO3366xk+Spa=z6bFW9TfqPk_8wUEd5scMK35JbXwpxZ2z7L2w@mail.gmail.com>
Subject: Re: [PATCH 0/7] R-Car D3 (r8a77995) CAN support
To: Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-can@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 22, 2017 at 7:10 PM, Simon Horman <horms@verge.net.au> wrote:
> On Fri, Nov 17, 2017 at 11:41:22AM +0100, Ulrich Hecht wrote:
>> Hi!
>>
>> Here's CAN and CAN FD support for the R-Car D3. This is a by-the-datasheet
>> implementation, with the datasheet missing some bits, namely the pin map.
>> I filled in the gaps with frog DNA^W^W^Wby deducing the information from
>> pin numbers already in the PFC driver, so careful scrutiny is advised.
>>
>> CU
>> Uli
>>
>>
>> Ulrich Hecht (7):
>>   pinctrl: sh-pfc: r8a77995: Add CAN support
>>   pinctrl: sh-pfc: r8a77995: Add CAN FD support
>>   arm64: dts: r8a77995: Add CAN external clock support
>>   arm64: dts: r8a77995: Add CAN support
>>   arm64: dts: r8a77995: Add CAN FD support
>>   can: rcar_can: document r8a77995 (R-Car D3) compatibility strings
>>   can: rcar_canfd: document r8a77995 (R-Car D3) compatibility strings
>
> Hi Ulrich,
>
> is it safe, from a regression point of view, to apply the dts patches
> to a tree that does not have the other patches present?

I believe it is.

CU
Uli
