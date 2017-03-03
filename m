Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:38151 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751602AbdCCQH6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 11:07:58 -0500
Subject: Re: [PATCH v4 7/9] drm: bridge: dw-hdmi: Add support for custom PHY
 configuration
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
 <1616563.9xlBnf0tlo@avalon>
 <a0fa074e-500e-e290-4b8b-7f6cdedaee6f@synopsys.com>
 <20121862.XIvFFZlWoF@avalon>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <e7045d3d-f376-a9d5-c5ce-7d336f6bb5d0@synopsys.com>
Date: Fri, 3 Mar 2017 15:57:57 +0000
MIME-Version: 1.0
In-Reply-To: <20121862.XIvFFZlWoF@avalon>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 02-03-2017 15:38, Laurent Pinchart wrote:
> Hi Jose,
>
> On Thursday 02 Mar 2017 14:50:02 Jose Abreu wrote:
>> On 02-03-2017 13:41, Laurent Pinchart wrote:
>>>> Hmm, this is kind of confusing. Why do you need a phy_ops and
>>>> then a separate configure_phy function? Can't we just use phy_ops
>>>> always? If its external phy then it would need to implement all
>>>> phy_ops functions.
>>> The phy_ops are indeed meant to support vendor PHYs. The .configure_phy()
>>> operation is meant to support Synopsys PHYs that don't comply with the
>>> HDMI TX MHL and 3D PHYs I2C register layout and thus need a different
>>> configure function, but can share the other operations with the HDMI TX
>>> MHL and 3D PHYs. Ideally I'd like to move that code to the dw-hdmi core,
>>> but at the moment I don't have enough information to decide whether the
>>> register layout corresponds to the standard Synopsys HDMI TX 2.0 PHY or
>>> if it has been modified by the vendor. Once we'll have a second SoC using
>>> the same PHY we should have more information to consolidate the code. Of
>>> course, if you can share the HDMI TX 2.0 PHY datasheet, I won't mind
>>> reworking the code now ;-)
>> Well, if I want to keep my job I can't share the datasheet, and I
>> do want to keep my job :)
> That's so selfish :-D
>
>> As far as I know this shouldn't change much. I already used (it
>> was like a year ago) the dw-hdmi driver in a HDMI TX 2.0 PHY.
> I really wonder what exactly has been integrated in the Renesas R-Car Gen3 
> SoC. The PHY is certainly reported as an HDMI TX 2.0 PHY, but the registers 
> seem different compared to the 2.0 PHY you've tested.
>
>> But I am not following your logic here, sorry: You are mentioning a
>> custom phy, right?
> Custom is probably a bad name. From what I've been told it's a standard 
> Synopsys PHY, but I can't rule out vendor-specific customizations.
>
>> If its custom then it should implement its own phy_ops. And I don't think
>> that phy logic should go into core, this should all be extracted because I
>> really believe it will make the code easier to read. Imagine this
>> organization:
>>
>>     Folders/Files:
>>         drm/bridge/dw-hdmi/dw-hdmi-core.c
>>         drm/bridge/dw-hdmi/dw-hdmi-phy-synopsys.c
>>         drm/bridge/dw-hdmi/dw-hdmi-phy-*renesas*.c
>>         drm/bridge/dw-hdmi/dw-hdmi-phy-something.c
>>     Structures:
>>         dw_hdmi_pdata
>>         dw_hdmi_phy_pdata
>>         dw_hdmi_phy_ops
> That looks good to me.
>
>> As the phy is interacted using controller we would need to pass
>> some callbacks to the phy, but ultimately the phy would be a
>> platform driver which could have its own compatible string that
>> would be associated with controller (not sure exactly about this
>> because I only used this in non-dt).
> We already have glue code, having to provide separate glue and PHY drivers 
> seems a bit overkill to me. If we could get rid of glue code by adding a node 
> for the PHY in DT that would be nice, but if we have to keep the glue then we 
> can as well use platform data there.
>
>> This is just an idea though. I followed this logic in the RX side
>> and its very easy to add a new phy now, its a matter of creating
>> a new file, implement ops and associate it with controller. Of
>> course some phys will be very similar, for that we can use minor
>> tweaks via id detection.
>>
>> What do you think?
> It sounds neat overall, but I wonder whether it should really block this 
> series, or be added on top of it :-) I think we're already moving in the right 
> direction here.
>

This series is definitely a good starting point and a good
improvement. We can think later about abstracting even more the
phy from the controller. I think this will be a major step and
will reflect better how the HW is modeled.

You can add my reviewed-by in all the patches in this series in
your next submission (or in the merge).

Also, if you do a next submission what do you think about moving
all the dw-hdmi files to a new folder called for example
'synopsys' or 'dw-hdmi'? Because we already have 5 files. I think
'synopsys' instead of 'dw-hdmi' would be better because in the
future we may add support for other protocols (for example
display port).

Side note: I think you missed in the cc Archit Taneja

Best regards,
Jose Miguel Abreu
