Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:53278 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751738AbeEUMZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 08:25:54 -0400
From: Felipe Balbi <balbi@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2] usb: gadget: function: printer: avoid wrong list handling in printer_write()
In-Reply-To: <1526901487-22438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526901487-22438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 21 May 2018 15:24:06 +0300
Message-ID: <87tvr16vtl.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Greg,

Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> writes:
> When printer_write() calls usb_ep_queue(), a udc driver (e.g.
> renesas_usbhs driver) may call usb_gadget_giveback_request() in
> the udc .queue ops immediately. Then, printer_write() calls
> list_add(&req->list, &dev->tx_reqs_active) wrongly. After that,
> if we do unbind the printer driver, WARN_ON() happens in
> printer_func_unbind() because the list entry is not removed.
>
> So, this patch moves list_add(&req->list, &dev->tx_reqs_active)
> calling before usb_ep_queue().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>

I'm not sure if you're still taking bug fixes for current -rc cycle, but
if you are, please take this directly. If you're done with v4.17, please
apply this on top of my pull request which I sent an hour or so ago.

Thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlsCumYACgkQzL64meEa
mQbFsA/+Id8ppJQ/XrDsCmaCb8VHt+dW/8qMfjCRhbALXvUkzxwHScGh16+OYDgY
rBXKTfDBPFPOrZ2coq1O/8AyJT5lI7dy6c1BddeXYp9RNMn24hIKFD1LK4EysBJB
MnqGacRMxpJJziIxaB3SLy8yahKnYsqsL7r5W4PwHda97oKqYWAc0nYY/Ot1vX72
fyiK6dUiQ/cfIPvJIp3C8kWAzSRDxyirMZqcq5/SZoOQhd+EuW/7eBKEvQv1k+ex
80k7GjEoOONeRZabuwQpgBsVze+ej8BUkaRjc/8W2/7XZzv+uBAZrjcdXDnC8xGl
k8OeEY4Zbl3YZ5M2Wc0//wSizTJ6BvD9eMcjkKnUE/P9Mba13avKMWFNEKZ/I30U
dcErLHXLINmGadRlvWbXQeP+mdh94SL6Ny/2/YGvASWU/N9UvFpGkH/2bpUtxyy3
Q0vET7dFEUvfavHLsb2/kVfFRim9GKSofdSZ1q5q7ynUw/gca4RsSo/u62EsGSag
fQmnJM+7DCYb4ycr5tbteaMDf4Adtg75HwyBZCftFz5f0DRnPNHyR9ETz4mKpUbE
92rIze6KM5jfx44YDlnFTYgMrX+jLQPVYmNbfDk9eCL8bmOJulgD0tuhn7NEeQXX
Szqky1EQ3ebDpBh5GgXzcvxl5zzeQglVX2bU1cZE+/13BpGeNII=
=FbAu
-----END PGP SIGNATURE-----
--=-=-=--
