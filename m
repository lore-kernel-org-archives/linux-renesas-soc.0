Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2356342.Lly4sZCK6s@avalon>
References: <20180112231430.26943-1-laurent.pinchart+renesas@ideasonboard.com>
 <71c9aaea-a721-6cec-5b7f-f14f7e21d191@gmail.com> <CAL_JsqKD_VKMrfi42hZ3eHPAMWBwryV0g_cXDUeyaKfPP99LmA@mail.gmail.com>
 <2356342.Lly4sZCK6s@avalon>
From: Rob Herring <robh@kernel.org>
Date: Tue, 16 Jan 2018 10:54:00 -0600
Message-ID: <CAL_Jsq+4X17Q+wva0R6sPHY02TJ5+E5vE8Y98+DB5VF2MdFy0g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] drm: rcar-du: Fix legacy DT to create LVDS
 encoder nodes
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Rowand <frowand.list@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 16, 2018 at 10:32 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Rob,
>
> On Tuesday, 16 January 2018 16:35:26 EET Rob Herring wrote:
>> On Mon, Jan 15, 2018 at 5:46 PM, Frank Rowand wrote:
>> > On 01/15/18 12:29, Laurent Pinchart wrote:
>> >> On Monday, 15 January 2018 22:12:33 EET Frank Rowand wrote:
>> >>> On 01/15/18 11:22, Laurent Pinchart wrote:
>> >>>> On Monday, 15 January 2018 21:12:44 EET Frank Rowand wrote:
>> >>>>> On 01/15/18 09:09, Rob Herring wrote:
>> >>>>>> On Fri, Jan 12, 2018 at 5:14 PM, Laurent Pinchart wrote:
>> >>>>>>> The internal LVDS encoders now have their own DT bindings. Before
>> >>>>>>> switching the driver infrastructure to those new bindings, implement
>> >>>>>>> backward-compatibility through live DT patching.

[...]

>> >> How would you like to proceed ? I can try the manual approach again but
>> >> need information about how I could cleanly implement phandle allocation.
>> >> I will likely then run into other issues for which I might need help.
>> >
>> > Here are my first thoughts, based on 4.15-rc7:
>> >
>> > Question to Rob and Frank: should of_attach_node() be called directly, or
>> > should it be called indirectly by creating a change set that adds the
>> > node?
>> >
>> > Frank's off the cuff answer (but would like to think more about it): since
>> > the driver is modifying its own devicetree data, and thus no other entity
>> > needs to be notified about the changes, there is no need to add the
>> > complexity of using a change set.
>>
>> There's exactly 2 users outside of the DT core. That's generally a
>> sign of an API I'd like to make private.
>>
>> > The following is how of_attach_node() could be modified to dynamically
>> > create a phandle on request.
>>
>> How would this work for all the phandle references that need to be fixed up?
>
> As I know which properties contain a phandle that needs to be fixed up, my
> plan is to update those properties manually with the value of the newly
> allocated phandle.

That sounds like more low level, internal detail mucking with than
this current patch.

> What I need here is the ability to insert the following structure in the
> device tree:
>
>         lvds@feb90000 {
>                compatible = "renesas,r8a7796-lvds"; (*)
>                reg = <0 0xfeb90000 0 0x14>; (*)
>                clocks = <&cpg CPG_MOD 727>; (*)

I'm still of the opinion that all of this should be in a per SoC overlay.

>
>                ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         port@0 {
>                                 reg = <0>;
>                                 lvds0_in: endpoint {
>                                         remote-endpoint = <&du_out_lvds0>; (*)
>                                 };
>                         };
>                         port@1 {
>                                 reg = <1>;
>                                 lvds0_out: endpoint {
>                                         remote-endpoint = <&panel_in>; (*)

Then do the fixup of just the remote-endpoint properties. While it
would be nice to say overlays are completely static, I'm guessing
that's not going to be the case. After all, we pretty much have
overlays because DT being static has limitations.

>                                 };
>                         };
>                 };
>         };
>
> with the node unit address and all properties marked with a (*) computed at
> runtime based on information extract from the device tree. Additionally I need
> phandles for the lvds0_in and lvds0_out nodes, and set the value of two
> properties in the tree with those phandles.
>
> I've used overlays as that was the only way I found to allocate phandles, but
> any other API will work for me as well.

I don't think drivers mucking with phandles directly to avoid another
overlay user is an improvement.

Rob
