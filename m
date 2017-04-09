Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:33475 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751961AbdDILrD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Apr 2017 07:47:03 -0400
MIME-Version: 1.0
In-Reply-To: <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Sun, 9 Apr 2017 12:47:01 +0100
Message-ID: <CACvgo52dydV5fpcDDPnFaRN32uxoeitvazwPpxOs4wOqg0=45A@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-renesas-soc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Pardon for reviving this old thread. I've noticed a couple of things
which might want some attention.

On 19 November 2016 at 03:28, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:

> +
> +- panel-timing: Most display panels are restricted to a single resolution and
> +  require specific display timings. The panel-timing subnode expresses those
> +  timings as specified in the timing subnode section of the display timing
> +  bindings defined in
> +  Documentation/devicetree/bindings/display/display-timing.txt.
Cannot find such a file in linux-next. Perhaps you meant
Documentation/devicetree/bindings/display/panel/display-timing.txt?

Documentation/devicetree/bindings/display/panel/panel.txt includes a
"rotation" property, which we might want to fold here.

Regards,
Emil
