Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:42929 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752400AbdCCTPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 14:15:06 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: drm: rcar-du: Document optional reset properties
Date: Fri, 03 Mar 2017 21:15:28 +0200
Message-ID: <1531026.gKWzV6n1Kn@avalon>
In-Reply-To: <CAMuHMdWd+7bgRBCG+5jHvbds1_u9j5fN3_BmgMaim2o_JP+rcw@mail.gmail.com>
References: <1488547835-25229-1-git-send-email-geert+renesas@glider.be> <CAMuHMdU=1O_ZZgAXWSecO=HRtZdY8s0LfEMuUkpgvr528HV+Jw@mail.gmail.com> <CAMuHMdWd+7bgRBCG+5jHvbds1_u9j5fN3_BmgMaim2o_JP+rcw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Friday 03 Mar 2017 20:04:26 Geert Uytterhoeven wrote:
> On Fri, Mar 3, 2017 at 8:03 PM, Geert Uytterhoeven wrote:
> >>> +Optional properties:
> >>> +  - resets: A list of phandles + reset-specifier pairs, one for each
> >>> entry in
> >> 
> >> s/phandlers/phandle/
> > 
> > You're seeing typos that do not exist ;-)
> 
> Ah, you mean plural vs. singular?

Yes that's what I meant.

> You're right, but I just copied that from the "clocks" description...

Oops :-)

-- 
Regards,

Laurent Pinchart
