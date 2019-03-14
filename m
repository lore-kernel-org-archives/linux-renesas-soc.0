Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4BAC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D08F21019
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 10:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfCNK6z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 06:58:55 -0400
Received: from mga02.intel.com ([134.134.136.20]:37771 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726629AbfCNK6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 06:58:55 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Mar 2019 03:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,478,1544515200"; 
   d="scan'208";a="154950383"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 14 Mar 2019 03:53:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 14 Mar 2019 12:53:47 +0200
Date:   Thu, 14 Mar 2019 12:53:47 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <20190314105347.GC7752@kuha.fi.intel.com>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 14, 2019 at 10:14:12AM +0000, Biju Das wrote:
> Hi Shimoda-San,
> 
> Thanks for the feedback.
> 
> > Subject: RE: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> > switch property
> > 
> > Hi Biju-san,
> > 
> > > From: Biju Das, Sent: Thursday, March 14, 2019 5:40 PM
> > >
> > > Add support for renesas_usb3 to support dual role switch using usb
> > > role switch class framework.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  V1-->V2
> > >   * Added usb-role-switch-property
> > >   * Updated the example with usb-role-switch property.
> > > ---
> > >  .../devicetree/bindings/usb/renesas_usb3.txt       | 22
> > ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > index 35039e7..eecaf4c 100644
> > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > @@ -22,6 +22,7 @@ Required properties:
> > >  Optional properties:
> > >    - phys: phandle + phy specifier pair
> > >    - phy-names: must be "usb"
> > > +  - usb-role-switch: use USB role switch to support dual-role switch
> > 
> > I don't think we can add such a property. At least, we have to add "renesas,"
> > prefix.
> 
> usb_role_switch_get   api uses  "usb-role-switch"  property to get role switch linked with the device.
> 
> HD3SS3220 port controller driver gets role switch handle linked with the device using usb_role_switch_get  api.  
> That is the reason, I have added " usb-role-switch" property here.
> 
> Do you have any other suggestion to get usb role switch handle?

We can still change the API. Can we use the compatible for this?


thanks,

-- 
heikki
