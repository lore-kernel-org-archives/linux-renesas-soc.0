Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96ECC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB334207E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfCILWh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 06:22:37 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42395 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725841AbfCILWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 06:22:37 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BC50960005;
        Sat,  9 Mar 2019 11:22:33 +0000 (UTC)
Date:   Sat, 9 Mar 2019 12:23:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH/RFC 05/15] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190309112308.rbuqwvvvxgihmj7d@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-6-laurent.pinchart+renesas@ideasonboard.com>
 <20190308164925.jwgq4rdqh6mmwwtf@uno.localdomain>
 <20190308175739.GA11318@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wrhg5c4tjjfmcuvy"
Content-Disposition: inline
In-Reply-To: <20190308175739.GA11318@pendragon.ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--wrhg5c4tjjfmcuvy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

HI Laurent,

On Fri, Mar 08, 2019 at 07:57:39PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Fri, Mar 08, 2019 at 05:49:25PM +0100, Jacopo Mondi wrote:
> > On Thu, Mar 07, 2019 at 01:23:35AM +0200, Laurent Pinchart wrote:
> > > The THC63LVD1024 LVDS decoder can operate in two modes, single-link or
> > > dual-link. In dual-link mode both input ports are used to carry even-
> > > and odd-numbered pixels separately. Document this in the DT bindings,
> > > along with the related rules governing port and usage.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  .../bindings/display/bridge/thine,thc63lvd1024.txt         | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > index 37f0c04d5a28..4ff6eb9bbc19 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > +++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
> > > @@ -28,6 +28,13 @@ Optional video port nodes:
> > >  - port@1: Second LVDS input port
> > >  - port@3: Second digital CMOS/TTL parallel output
> > >
> > > +The device can operate in single-link mode or dual-link mode. In single-link
> > > +mode, all pixels are received on port@0, and port@1 shall not contain any
> > > +endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
> > > +odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
> > > +endpoints.
> >
> > You know, I'm not sure this is helpful, as if we have to go and
> > describe what the chip supports, a paragraph for dual ouput mode would
> > be required as well. The bindings already document that the chip
> > supports single/dual input/output modes, maybe you can just add rules
> > that prescribes how to populate the endpoints, for both input and
> > output modes?
>
> That's what I was trying to do :-) How else would you like to see it
> described ?
>

I wonder if it won't be enough to expand the Optional endpoint
properties description as in:

 - port@1: Second LVDS input port, to be used for dual-input mode
 - port@3: Second digital CMOS/TTL parallel output, to be used for
   dual-output mode.

If you prefer providing more context, it's fine what you had, just
keep in mind there's also dual-output mode and not just the dual-input
one.

Up to you, feel free to add my
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
if relevant.

Thanks
  j

> > > +
> > > +
> >
> > You can drop this empty line.
> >
> > >  Example:
> > >  --------
> > >
>
> --
> Regards,
>
> Laurent Pinchart

--wrhg5c4tjjfmcuvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyDohwACgkQcjQGjxah
VjztpQ/9F5yBiWZaYawkngfnWMnB9ivF8Y4K6Xu1WfD7xp2QWQgtf6jBcmG0yuu1
+5ZxdM9K94Ontuj9mCxxwy4gYtd5FPNkSuZpqvfov0mWCqFfcuMDoXDhaCydIIEq
ZRtV0VkyHnVqHGr57TlhaLZfaA83C6etJ1cqxk/BgLMYv2INbEUQiLoJUAEk0fry
WniCuhymfOl1ZiDO4ipYbHHsQIfSLqRaoS0J2vW2h/PgKMBSaYJNtc6UCnI9r6oK
be6SzuiPZyS8OIJQKC4Wt54YZJUpbYKKa7hqIgmO84LXqv5W3JUdY0KxaKuf9SwD
osdxinDiUk0WZ45XLkq8csPZPmvEWxsNaZILC0V+39kAtPuzW8pIO6skN9JucZOj
h3c4CFrdfMXGKjMh5wDJU/DYKqUA0RTMFKLMTg5dEUOTQW/8132YhwGHLDPHatOj
2obiudSTbpwctt0J1rbEgvYV6QDlw9n9so+OLyiLZqKIo4ryTS/ZCiyhU9LbZVLd
bHuYeb5KHekeZZ0TLE/3mk77ArNYOCvqRWx7XG80mlkv1Id6wB4SIIUdc9ajWEB7
GVYPh02ekI2t+3QRs9DMRxrPX0ODVaExvXPY13JVqTAvYLrdw4rPm45UtjUMW8ms
HkVrsowjogpxY37g5/vKgTVwn0/uTFIqMEijm10EdtimB4/+bhg=
=ZGvw
-----END PGP SIGNATURE-----

--wrhg5c4tjjfmcuvy--
