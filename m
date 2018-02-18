Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:40815 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750961AbeBRXG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Feb 2018 18:06:57 -0500
Date: Sun, 18 Feb 2018 17:06:55 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: add R8A77980 CPG core clock
 definitions
Message-ID: <20180218230655.z226jdvx3i25cqp3@rob-hp-laptop>
References: <644095ad-42c5-a4fc-728a-76377938d2f1@cogentembedded.com>
 <7691d7f4-364d-bd7b-f9fe-ea49e7c2ab09@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7691d7f4-364d-bd7b-f9fe-ea49e7c2ab09@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 15, 2018 at 02:56:53PM +0300, Sergei Shtylyov wrote:
> Add macros usable by the device tree sources to reference the R8A77980
> CPG core clocks by index. The data come from the table 8.2e of the R-Car
> Series, 3rd Generation User's Manual: Hardware (Rev. 0.80, Oct, 2017),
> however I had to add the Z2 clock which is somehow present only on the
> figure 8.1e...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> Changes in version 2:
> - wrapped the SPDX license ID in its own comment;
> - added Geert's tag.
> 
>  include/dt-bindings/clock/r8a77980-cpg-mssr.h |   51 ++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
