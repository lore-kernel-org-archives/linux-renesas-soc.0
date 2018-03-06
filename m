Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f49.google.com ([209.85.160.49]:41369 "EHLO
        mail-pl0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753656AbeCFVkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Mar 2018 16:40:23 -0500
Subject: Re: Overlay sugar syntax (was: Re: [PATCH v6 3/4] drm: rcar-du: Fix
 legacy DT to create LVDS encoder nodes)
From: Frank Rowand <frowand.list@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        David Gibson <david@gibson.dropbear.id.au>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Message-ID: <28e8e3cb-263d-5352-badf-34b269ad860b@gmail.com>
Date: Tue, 6 Mar 2018 13:40:20 -0800
MIME-Version: 1.0
In-Reply-To: <e46f67ff-2900-8500-b1aa-503a9757997f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/06/18 11:51, Frank Rowand wrote:
> On 03/06/18 04:30, Geert Uytterhoeven wrote:
>> Hi David,
>>
>> On Tue, Mar 6, 2018 at 4:54 AM, David Gibson
>> <david@gibson.dropbear.id.au> wrote:
>>> On Fri, Feb 23, 2018 at 09:05:24AM +0100, Geert Uytterhoeven wrote:
>>>> On Fri, Feb 23, 2018 at 3:38 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>>>> I was hoping to be able to convert the .dts files to use sugar syntax
>>>>> instead of hand coding the fragment nodes, but for this specific set
>>>>> of files I failed, since the labels that would have been required do
>>>>> not already exist in the base .dts files that that overlays would be
>>>>> applied against.
>>>>
>>>> Indeed, hence the fixup overlays use "target-path".
>>>>
>>>> BTW, is there any specific reason there is no sugar syntax support in dtc
>>>> for absolute target paths? I guess to prevent adding stuff to a random
>>>> existing node, and to encourage people to use a "connector" API defined in
>>>> term of labels?
>>>
>>> Only because it hasn't been implemented.  Using &{/whatever} should
>>> IMO generate a target-path and the fact it doesn't is a bug.
>>>
>>>> I'm also in the process of converting my collection of DT overlays to sugar
>>>> syntax, and lack of support for "target-path" is the sole thing that holds
>>>> me back from completing this. So for now I use a mix of sugar and
>>>> traditional overlay syntax.
>>>>
>>>> In particular, I need "target-path" for two things:
>>>>   1. To refer to the root node, for adding devices that should live at
>>>>      (a board subnode of) the root node, like:
>>>>        - devices connected to GPIO controllers provided by other base or
>>>>          overlay devices (e.g. LEDs, displays, buttons, ...),
>>>>        - clock providers for other overlays devices (e.g. fixed-clock).
>>
>>>> The former is the real blocker for me.
>>
>>> Below is draft patch adding target-path support.  The pretty minimal
>>> test examples do include a case using &{/}
>>>
>>> From 8f1b35f88395adea01ce1100c5faa27dacbc8410 Mon Sep 17 00:00:00 2001
>>> From: David Gibson <david@gibson.dropbear.id.au>
>>> Date: Tue, 6 Mar 2018 13:27:53 +1100
>>> Subject: [PATCH] Correct overlay syntactic sugar for generating target-path
>>>  fragments
>>>
>>> We've recently added "syntactic sugar" support to generate runtime dtb
>>> overlays using similar syntax to the compile time overlays we've had for
>>> a while.  This worked with the &label { ... } syntax, adjusting an existing
>>> labelled node, but would fail with the &{/path} { ... } syntax attempting
>>> to adjust an existing node referenced by its path.
>>>
>>> The previous code would always try to use the "target" property in the
>>> output overlay, which needs to be fixed up, and __fixups__ can only encode
>>> symbols, not paths, so the result could never work properly.
>>>
>>> This adds support for the &{/path} syntax for overlays, translating it into
>>> the "target-path" encoding in the output.  It also changes existing
>>> behaviour a little because we now unconditionally one fragment for each
>>> overlay section in the source.  Previously we would only create a fragment
>>> if we couldn't locally resolve the node referenced.  We need this for
>>> path references, because the path is supposed to be referencing something
>>> in the (not yet known) base tree, rather than the overlay tree we are
>>> working with now.  In particular one useful case for path based overlays
>>> is using &{/} - but the constructed overlay tree will always have a root
>>> node, meaning that without the change that would attempt to resolve the
>>> fragment locally, which is not what we want.
>>>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>
>> Thank you, seems to work fine on dtc.git.
> 
> And the patched dtc works for a dts file that I was trying to convert
> to sugar dts syntax

< snip >

I noticed that a space in "&{/}" is an error.  I wanted to check whether
that was deliberate, or that the patch wasn't fully complete yet.
cat path_sugar_v1.dts 

$ nl -ba path_sugar_v1.dts
     1	
     2	/dts-v1/;
     3	/plugin/;
     4	&{/} {
     5			#address-cells = <2>;
     6			#size-cells = <2>;
     7	
     8			my_node@feb90000 {
     9				compatible = "vendor,device";
    10				reg = <0 0xfeb90000 0 0x1c>;
    11	
    12			};
    13	
    14	};

$ dtc -O dts path_sugar_v1.dts 
/dts-v1/;

/ {

	fragment@0 {
		target-path = [2f 00];

		__overlay__ {
			#address-cells = <0x2>;
			#size-cells = <0x2>;

			my_node@feb90000 {
				compatible = "vendor,device";
				reg = <0x0 0xfeb90000 0x0 0x1c>;
			};
		};
	};
};

$ nl -ba path_sugar_v2.dts
     1	
     2	/dts-v1/;
     3	/plugin/;
     4	&{ / } {
     5			#address-cells = <2>;
     6			#size-cells = <2>;
     7	
     8			my_node@feb90000 {
     9				compatible = "vendor,device";
    10				reg = <0 0xfeb90000 0 0x1c>;
    11	
    12			};
    13	
    14	};

$ dtc -O dts path_sugar_v2.dts 
Error: path_sugar_v2.dts:4.1-2 syntax error
FATAL ERROR: Unable to parse input tree
