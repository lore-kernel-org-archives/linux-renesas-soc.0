Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34845 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751217AbdILQrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 12:47:16 -0400
Date: Tue, 12 Sep 2017 11:47:14 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH repost v2] serial: sh-sci: document R8A77970 bindings
Message-ID: <20170912164714.3x5hjmkasdjhninp@rob-hp-laptop>
References: <20170901221519.704978317@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170901221519.704978317@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Sep 02, 2017 at 01:15:13AM +0300, Sergei Shtylyov wrote:
> R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible SCIF and HSCIF
> ports, so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'tty-next' branch of GregKH's 'tty.git' repo.

So I guess you want Greg to apply because it doesn't apply to my tree. 
It's only a binding change, so not really any reason Greg has to take 
it.

Acked-by: Rob Herring <robh@kernel.org>

If you want me to apply, resend it against 4.14-rc1.

Rob
