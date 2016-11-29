Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2454182.olmziLZUmD@avalon>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161121164815.bxca4rfvifloizdh@rob-hp-laptop> <2307840.2mk6E40XHl@avalon> <2454182.olmziLZUmD@avalon>
From: Rob Herring <robh@kernel.org>
Date: Tue, 29 Nov 2016 09:14:09 -0600
Message-ID: <CAL_JsqL0+4--nE1UDHWzqS-s18A+q2i76S8=woCb5huV3jUMew@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] devicetree/bindings: display: Document common
 panel properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 2:27 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Rob,
>
> On Tuesday 22 Nov 2016 11:36:55 Laurent Pinchart wrote:
>> On Monday 21 Nov 2016 10:48:15 Rob Herring wrote:
>> > On Sat, Nov 19, 2016 at 05:28:01AM +0200, Laurent Pinchart wrote:
>> >> Document properties common to several display panels in a central
>> >> location that can be referenced by the panel device tree bindings.
>> >
>> > Looks good. Just one comment...
>> >
>> > [...]
>> >
>> >> +Connectivity
>> >> +------------
>> >> +
>> >> +- ports: Panels receive video data through one or multiple connections.
>> >> While
>> >> +  the nature of those connections is specific to the panel type, the
>> >> +  connectivity is expressed in a standard fashion using ports as
>> >> specified in
>> >> +  the device graph bindings defined in
>> >> +  Documentation/devicetree/bindings/graph.txt.
>> >
>> > We allow panels to either use graph binding or be a child of the display
>> > controller.
>>
>> I knew that some display controllers use a phandle to the panel (see the
>> fsl,panel and nvidia,panel properties), but I didn't know we had panels as
>> children of display controller nodes. I don't think we should allow that for
>> anything but DSI panels, as the DT hierarchy is based on control buses. Are
>> you sure we have other panels instantiated through that mechanism ?

Some panels have no control bus, so were do we place them? I would say
the hierarchy is based on buses with a preference for the control bus
when there are multiple buses. I'm not a fan of just sticking things
are the top level.

> Ping ?
>
> Please note that this file documents properties common to multiple panel DT
> bindings, but in no way makes it mandatory to use the OF graph bindings for
> panels. The decision is left to individual bindings.

It is mandatory in the sense that we don't want more cases of "fsl,panel".

Rob
