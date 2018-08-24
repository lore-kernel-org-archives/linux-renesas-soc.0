Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay10.mail.gandi.net ([217.70.178.230]:55379 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbeHXOJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 10:09:12 -0400
Date: Fri, 24 Aug 2018 12:35:07 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: niklas soderlund <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org
Subject: Testing HDMI on E3
Message-ID: <20180824103507.GG26480@w540>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent
   +Niklas in CC for support
   +renesas-socs to document the procedure

In order to test HDMI capture on D3 and Salvator-x boards, I have
always used Niklas' great vin-tests suite
git://git.ragnatech.se/vin-tests

And I suggest to do the same for E3.

* Add E3 support to vin-tests/boards.sh
  E3 has a video input pipeline similar to Salvator-X, and HDMI input
  connected to an adv7482, connected to a CSI-2 port, then to VIN.

  I cannot tell the exact entity names, but it is easy enough for you
  to find them out.

  I think you only need to tweak vin-tests/boards.sh to add Ebisu
  board there (look at my series doing that for D3, for E3 it's even
  simpler). Once the board is recognized, you can use other scripts.

* Set EDID on the HDMI port
  #vin-tests/set-edid
  You need to cross-compile vin-tests/src/edid/ in advance

  If this succeeds, the board is recognized.

* Capture with yavta
  Run
  #vin-tests/yavta-hdmi $VIN_INSTANCE

  The script configure links and set formats on all entities along the
  pipeline. At this point, I think the better thing to do is to try,
  see where it fails and adjust the entity names as required. Again,
  being this a 'standard' Gen3 capture pipeline, it should be easy
  enough.

- Before all that, I hope my Ebisu support series creates a proper media
  graph with all entities in place. No need to tell you, but check
  with media-ctl if everything looks correct for the E3 board.

Hope this helps.
   j

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbf99bAAoJEHI0Bo8WoVY8QrgP/3CqvGE4589bMFuuQMTpJA4v
imY29Tt0y6+Ft+nmGsmgmi2zAmT+TAcvzQwfieRDO6e634lc5b+xjNL8Wi1edfIW
MoiYkxCO7WQheP0BJeW7RQDYzfaHfQedUyjZ2Pov84Cj/Wd6L8DwNcrpSRRxfXo8
yXYX1/URnIXVIcSH9SFoiJDDwoHZfgF+rbdy6hPJLDrCrAHPKNv8KbxegnjA1zvb
Ts73zhljd0ZMyl3AgbjZFtfLakian+LT6xxDh6ENPbzdSNLcjEUs39GzjloG9Ysl
Y9UIv3Zlqp9h1+6joFJ4f7i61wUajLMiIw6XZCHbBfo52OnyUCd4shaws1j813vY
cSvagQ92DQhLbkI+loGhS0z5bWpl+Y8VO+rjNIlH5usd245rk3HcmSHwpmvQLQFt
Fsh0i/2DF7Izgh7jVAGsvsyhM/n1GFn/Kpyv56Mgo+WbnEc64W2cr7VZSdoJ75Jo
Iq+FdaOYQOtcbj+zkJwSz5Yf9goJYYabjBhxOtfgXpXGYePGksQTQWoSX0livUtv
O8SW3tvNKKXNm6Yx61bRA0TkS7oPprKXzpa6nPO5NMaLHd7phY2Fa4N2ZBsDAcBd
+Pk9rW/diQIsAmkZSL0TqgidGFxcogCNwpJb0EHNBMIciVlnnt9bQzPqhNaGPCJ6
we//hCjBu9MyyjLwZuC3
=0QCH
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
