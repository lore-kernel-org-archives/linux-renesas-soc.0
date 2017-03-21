Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:32908 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932641AbdCUUPq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2017 16:15:46 -0400
Received: by mail-lf0-f47.google.com with SMTP id a6so71311990lfa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2017 13:14:46 -0700 (PDT)
Subject: Re: [PATCH 1/2] ARM: dts: r8a7792: add IMR-L[S]X3 clocks
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20170321200443.078095898@cogentembedded.com>
 <34050114-752a-08b6-700e-697e78102af7@cogentembedded.com>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a802018c-9943-22e5-0f78-28b8ab9689d9@cogentembedded.com>
Date: Tue, 21 Mar 2017 23:14:43 +0300
MIME-Version: 1.0
In-Reply-To: <34050114-752a-08b6-700e-697e78102af7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/21/2017 11:08 PM, Sergei Shtylyov wrote:

> Still not cover letter but I think it's better now, so I won't retry...
> The patches are against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20170321-v4.11-rc3' tag.

    The patches depend on the IMR driver patches adding the IMR-L[S]X3 support 
for the "compatible" values.

MBR, Sergei
