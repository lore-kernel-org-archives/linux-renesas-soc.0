Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41213 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753585AbcKVNNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 08:13:52 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common panel properties
Date: Tue, 22 Nov 2016 15:14:08 +0200
Message-ID: <2645572.hCCJeODTBK@avalon>
In-Reply-To: <20161122110548.GB22735@ulmo.ba.sec>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1479526093-7014-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161122110548.GB22735@ulmo.ba.sec>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thierry,

On Tuesday 22 Nov 2016 12:05:48 Thierry Reding wrote:
> On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
> > Document properties common to several display panels in a central
> > location that can be referenced by the panel device tree bindings.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  .../bindings/display/panel/panel-common.txt        | 91 +++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644
> >  Documentation/devicetree/bindings/display/panel/panel-common.txt> 
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > new file mode 100644
> > index 000000000000..ec52c472c845
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> > @@ -0,0 +1,91 @@
> > +Common Properties for Display Panel
> > +===================================
> > +
> > +This document defines device tree properties common to several classes of
> > +display panels. It doesn't constitue a device tree binding specification
> > by
> > +itself but is meant to be referenced by device tree bindings.
> > +
> > +When referenced from panel device tree bindings the properties defined in
> > this
> > +document are defined as follows. The panel device tree bindings are
> > +responsible for defining whether each property is required or optional.
> > +
> > +
> > +Descriptive Properties
> > +----------------------
> > +
> > +- width-mm,
> > +- height-mm: The width-mm and height-mm specify the width and height of
> > the
> > +  physical area where images are displayed. These properties are
> > expressed in
> > +  millimeters and rounded to the closest unit.
> 
> Erm... this is already implied by the compatible string. Having this in
> device tree is completely redundant.

Nothing new under the sun here, we already have plenty of properties that 
could be implied by compatible strings. For instance for SoC IP cores many 
vendors use both an SoC-specific compatible string and a generic compatible 
string (e.g. "renesas,gpio-r8a7795" and "renesas,gpio-rcar"). The SoC-
compatible string implies register addresses, clocks and interrupts, but we 
still describe them in DT.

At the end of the day information about devices and their integration in the 
system needs to be available, either from DT or from C code. DT bindings 
should be designed to strike a good balance there, avoiding redundant 
information in DT (and thus keeping the bindings simple) while still providing 
enough information to allow for a reasonable level of genericity in OS 
implementations.

> > +- label: The label property specifies a symbolic name for the panel as a
> > +  string suitable for use by humans. It typically contains a name
> > inscribed on
> > +  the system (e.g. as an affixed label) or specified in the system's
> > +  documentation (e.g. in the user's manual).
> > +
> > +  If no such name exists, and unless the property is mandatory according
> > to
> > +  device tree bindings, it shall rather be omitted than constructed of
> > +  non-descriptive information. For instance an LCD panel in a system that
> > +  contains a single panel shall not be labelled "LCD" if that name is not
> > +  inscribed on the system or used in a descriptive fashion in system
> > +  documentation.
> > +
> > +
> > +Display Timings
> > +---------------
> > +
> > +- panel-timing: Most display panels are restricted to a single resolution
> > and
> > +  require specific display timings. The panel-timing subnode expresses
> > those
> > +  timings as specified in the timing subnode section of the display
> > timing
> > +  bindings defined in
> > +  Documentation/devicetree/bindings/display/display-timing.txt.
> 
> Why? That's also implied by the compatible string. Honestly, I thought
> by now we had been over this often enough...

Same argument as above. I won't try to change your mind and fix the simple 
panel driver, but I still stand firm on my belief that expressing the size and 
timings in DT is the right solution in a wide variety of cases (and yes I've 
read http://sietch-tagr.blogspot.fi/2016/04/display-panels-are-not-special.html, and while I agree with the title, I still believe size and 
timings in DT are not wrong).

-- 
Regards,

Laurent Pinchart
