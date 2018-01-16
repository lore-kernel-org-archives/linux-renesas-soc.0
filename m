Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751742AbeAPOft (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 09:35:49 -0500
MIME-Version: 1.0
In-Reply-To: <71c9aaea-a721-6cec-5b7f-f14f7e21d191@gmail.com>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <1891263.xKRehmHzfM@avalon> <444f1b6b-fa57-da7c-08fd-51b28cdb5fff@gmail.com>
 <1552581.gP2TZVN6Sh@avalon> <71c9aaea-a721-6cec-5b7f-f14f7e21d191@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jan 2018 08:35:26 -0600
Message-ID: <CAL_JsqKD_VKMrfi42hZ3eHPAMWBwryV0g_cXDUeyaKfPP99LmA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
To: Frank Rowand <frowand.list@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 15, 2018 at 5:46 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 01/15/18 12:29, Laurent Pinchart wrote:
>> Hi Frank,
>>
>> On Monday, 15 January 2018 22:12:33 EET Frank Rowand wrote:
>>> On 01/15/18 11:22, Laurent Pinchart wrote:
>>>> On Monday, 15 January 2018 21:12:44 EET Frank Rowand wrote:
>>>>> On 01/15/18 09:09, Rob Herring wrote:
>>>>>> +Frank
>>>>>>
>>>>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
>>>>>>> The internal LVDS encoders now have their own DT bindings. Before
>>>>>>> switching the driver infrastructure to those new bindings, implement
>>>>>>> backward-compatibility through live DT patching.
>>>>>>
>>>>>> Uhh, we just got rid of TI's patching and now adding this one. I guess
>>>
>>> Let me first answer the question that you ask later.  You ask "Can we work
>>> on this together to find a solution that would suit us both ?"
>>>
>>> My answer to that is emphatically YES.  I will definitely work with you to
>>> try to find a good solution.
>>
>> \o/
>>
>>>>> Please no.  What we just got rid of was making it difficult for me to
>>>>> make changes to the overlay infrastructure.  There are issues with
>>>>> overlays that need to be fixed before overlays become really usable.
>>>>> I am about to propose the next change, which involves removing a
>>>>> chunk of code that I will not be able to remove if this patch is
>>>>> accepted (the proposal is awaiting me collecting some data about
>>>>> the impact of the change, which I expect to complete this week).
>>>
>>> I should have thought just a little bit more before I hit send.  The
>>> situation is even worse than I wrote.  One of the next steps (in
>>> addition to what I wrote about above) is to change the overlay apply
>>> function to accept a flattened device tree (FDT), not an expanded
>>> device tree.  In this changed model, the unflattened overlay is
>>> not available to be modified before it is applied.
>>
>> That makes sense if we consider overlays to be immutable objects that we apply
>> without offering a way to modify them. I won't challenge that API decision, as
>> my use of an overlay here is a bit of a hack indeed.
>>
>>> It is important for the devicetree infrastructure to have ownership
>>> of the FDT that is used to create the unflattened tree.  (Notice
>>> that in the proposed patch, rcar_du_of_get_overlay() follows the
>>> TI example of doing a kmemdup of the blob (FDT), then uses the
>>> copy for the unflatten.  The kmemdup() in this case is to create
>>> a persistent copy of the FDT.)  The driver having ownership of
>>> this copy, and having the ability to free it is one of the many
>>> problems with the current overlay implementation.
>>
>> Yes, that's something I've identified as well. Lots of work has been done to
>> clean up the OF core and we're clearly not done yet. I'm happy to see all the
>> improvements you're working on.
>>
>>>>> Can you please handle both the old and new bindings through driver
>>>>> code instead?
>>>>
>>>> I could, but it would be pointless. The point here is to allow cleanups in
>>>> the driver. The LVDS encoder handling code is very intrusive in its
>>>> current form and I need to get rid of it. There would be zero point in
>>>> moving to the new infrastructure, as the main point is to get rid of the
>>>> old code which prevents moving forward. As a consequence that would block
>>>> new boards from receiving proper upstream support. An easy option is to
>>>> break backward compatibility. I'm personally fine with that, but I assume
>>>> other people would complain :-)
>>>>
>>>> I can, on the other hand, work with you to see how live DT patching could
>>>> be implemented in this driver without blocking your code. When developing
>>>> this patch series I start by patching the device tree manually without
>>>> relying on overlays at all, but got blocked by the fact that I need to
>>>> allocate phandles for new nodes I create. If there was an API to allocate
>>>> an unused phandle I could avoid using the overlay infrastructure at all.
>>>> Or there could be other
>>>
>>> It seems reasonable to provide a way to autogenerate a phandle (if
>>> requested) by the devicetree code that creates a new node.  Were you using
>>> a function from drivers/of/dynamic.c to create the node?
>>
>> Not to allocate the node, no. I allocated the device_node structure manually
>> with kzalloc(), and inserted it in the device tree with of_attach_node(). Is
>> that the right approach ? I haven't been able to test the code as I stopped
>> when I realized I couldn't allocate phandles.
>>
>>>> options I'm not thinking of as I don't know what the changes you're
>>>> working on are. Can we work on this together to find a solution that
>>>> would suit us both ?
>>>
>>> Again, yes, I would be glad to work with you on this.
>>
>> How would you like to proceed ? I can try the manual approach again but need
>> information about how I could cleanly implement phandle allocation. I will
>> likely then run into other issues for which I might need help.
>
> Here are my first thoughts, based on 4.15-rc7:
>
> Question to Rob and Frank: should of_attach_node() be called directly, or
> should it be called indirectly by creating a change set that adds the node?
>
> Frank's off the cuff answer (but would like to think more about it): since
> the driver is modifying its own devicetree data, and thus no other entity
> needs to be notified about the changes, there is no need to add the complexity
> of using a change set.

There's exactly 2 users outside of the DT core. That's generally a
sign of an API I'd like to make private.

> The following is how of_attach_node() could be modified to dynamically create
> a phandle on request.

How would this work for all the phandle references that need to be fixed up?

Rob
