Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f48.google.com ([209.85.160.48]:40911 "EHLO
        mail-pl0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932753AbeCGCmH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Mar 2018 21:42:07 -0500
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>
References: <CAMuHMdUqvZEKu5v4E29ofjj09sv+Yxk41W4K+FnfqKQ=88AWRA@mail.gmail.com>
 <20180306035412.GU2650@umbus.fritz.box>
 <CAMuHMdU54Bb8aObwaOuq6u7HO_LVhpGv9uMjGbt8VcKruop_tA@mail.gmail.com>
 <e46f67ff-2900-8500-b1aa-503a9757997f@gmail.com>
 <28e8e3cb-263d-5352-badf-34b269ad860b@gmail.com>
 <20180307023031.GC3083@umbus.fritz.box>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <52edd21d-de54-9612-e50a-8bc9b6d2c39d@gmail.com>
Date: Tue, 6 Mar 2018 18:42:04 -0800
MIME-Version: 1.0
In-Reply-To: <20180307023031.GC3083@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/06/18 18:30, David Gibson wrote:
> On Tue, Mar 06, 2018 at 01:40:20PM -0800, Frank Rowand wrote:
>> On 03/06/18 11:51, Frank Rowand wrote:
>>> On 03/06/18 04:30, Geert Uytterhoeven wrote:

< snip >

>>> And the patched dtc works for a dts file that I was trying to convert
>>> to sugar dts syntax
>>
>> < snip >
>>
>> I noticed that a space in "&{/}" is an error.  I wanted to check whether
>> that was deliberate, or that the patch wasn't fully complete yet.
> 
> That's essentially deliberate - it's not really related to this patch
> at all.  The patch just re-uses the existing syntax for a "path
> reference".  The whole thing is treated as a single token, hence, no
> spaces.
> 
> It might be possible to change that, but it could introduce some
> complications when the path reference syntax is used in other places.
> So I'm disinclined to change it, unless there's a very strong reason
> to.
> 

< snip >

No, please do not change.  I just wanted to make sure I understood the
intended syntax.

BTW, thanks for all the time you've been putting into this recent stuff.
