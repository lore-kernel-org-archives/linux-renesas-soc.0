Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55AAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 17:53:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B931D20811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 17:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbfC1Rxk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 13:53:40 -0400
Received: from mga05.intel.com ([192.55.52.43]:23178 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727565AbfC1Rxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 13:53:40 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Mar 2019 10:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,281,1549958400"; 
   d="scan'208";a="159297587"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 28 Mar 2019 10:48:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 28 Mar 2019 19:48:35 +0200
Date:   Thu, 28 Mar 2019 19:48:35 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Message-ID: <20190328174835.GD9993@kuha.fi.intel.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190314105347.GC7752@kuha.fi.intel.com>
 <OSBPR01MB2103DDDD7A426E79259723FEB8440@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190315105146.GI7752@kuha.fi.intel.com>
 <20190328153353.GA3070@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328153353.GA3070@bogus>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 28, 2019 at 10:33:53AM -0500, Rob Herring wrote:
> On Fri, Mar 15, 2019 at 12:51:46PM +0200, Heikki Krogerus wrote:
> > Thanks,
> > 
> > On Fri, Mar 15, 2019 at 09:08:19AM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> > > > > > > a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > > index 35039e7..eecaf4c 100644
> > > > > > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > > @@ -22,6 +22,7 @@ Required properties:
> > > > > > >  Optional properties:
> > > > > > >    - phys: phandle + phy specifier pair
> > > > > > >    - phy-names: must be "usb"
> > > > > > > +  - usb-role-switch: use USB role switch to support dual-role
> > > > > > > + switch
> > > > > >
> > > > > > I don't think we can add such a property. At least, we have to add
> > > > "renesas,"
> > > > > > prefix.
> > > > >
> > > > > usb_role_switch_get   api uses  "usb-role-switch"  property to get role
> > > > switch linked with the device.
> > > > >
> > > > > HD3SS3220 port controller driver gets role switch handle linked with the
> > > > device using usb_role_switch_get  api.
> > > > > That is the reason, I have added " usb-role-switch" property here.
> > > > >
> > > > > Do you have any other suggestion to get usb role switch handle?
> > > > 
> > > > We can still change the API. Can we use the compatible for this?
> > > 
> > > Do you mean usb_role_switch_get  API needs  to handle compatible "usb-x-connector"  wherex= a,b ,c ?
> > > Then it uses the graphs api to get the device linked with it and return the usb role switch handle.
> > > In that case, no need to add  generic "usb-role-switch"  property here.
> > > 
> > > Can you please confirm my understanding is correct?
> > 
> > No, I meant the compatible property would have the value
> > "usb-role-switch". Your compatible would probable look something
> > like this:
> > 
> >         compatible = "renesas,r8a774c0-usb3-peri",
> >                      "usb-role-switch";
> > 
> > So the idea would be that the device supplying USB role switch
> > functionality, in your case the USB controller, would need to have the
> > compatible property containing "usb-role-switch".
> 
> That's not really something a driver could bind to nor provides any info 
> as to what the h/w is (and how to interact with it).

Fair enough. As I said, I don't know much about DT.

The problem we are trying to solve here is, how to identify the USB
role switch from graph. It's primarily the USB Type-C connector
drivers that need to be able to get a handle to the role switch device
so they can tell it what to do. Basically the caller of
usb_role_switch_get() will have the compatible "usb-c-connector", so
it's of no use to us. We need the other endpoint, the role switch.

Note: The USB role switch device will be a discrete (or integrated)
mux on platforms that have separate USB host and USB device
controllers, and on platforms with dual-role capable USB controller
(like this one) the USB controller will represent it.

At the moment the function usb_role_switch_get() walks trough the
graph of the caller (so the connector) and expects that the
remote-endpoint representing the mux will have a boolean property
"usb-role-switch".

I do agree that Documentation/devicetree/bindings/usb/renesas_usb3.txt
should not be the file describing that boolean property, but if we had
a separate file describing the bindings for just the USB role switch
devices, would using it still be OK?

If not, then can you propose something else? How do we identify the
USB role switch endpoint from the graph? Would it be OK to expect the
the endpoint subnode to have that boolean property instead?


thanks,

-- 
heikki
