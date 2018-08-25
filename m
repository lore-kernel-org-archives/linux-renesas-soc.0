Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42051 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbeHYNI0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 25 Aug 2018 09:08:26 -0400
Date: Sat, 25 Aug 2018 11:29:59 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] vin-tests: yavta-hdmi: Add VIN4 and parallel link
Message-ID: <20180825092959.GJ26480@w540>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-5-git-send-email-jacopo@jmondi.org>
 <20180824162702.GG1493@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="NqNl6FRZtoRUn5bW"
Content-Disposition: inline
In-Reply-To: <20180824162702.GG1493@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--NqNl6FRZtoRUn5bW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, Aug 24, 2018 at 06:27:02PM +0200, Niklas S=C3=B6derlund wrote:
> Hi Jacopo,
>
> Thanks for your patch.
>
> On 2018-08-24 12:24:22 +0200, Jacopo Mondi wrote:
> > Add support for VIN4 to yavta-hdmi and check if format propagation shou=
ld
> > go through 'mc_propagate_parallel()' if the HDMI receiver chip is an
> > ADV7612 one.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  yavta-hdmi | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/yavta-hdmi b/yavta-hdmi
> > index fdec546..2e3b625 100755
> > --- a/yavta-hdmi
> > +++ b/yavta-hdmi
> > @@ -33,14 +33,23 @@ case $vc in
> >          dev=3D/dev/$vin3
> >          csipad=3D4
> >          ;;
> > +    4)
> > +        vinname=3D$vinname4
> > +        dev=3D/dev/$vin4
>
> I think you should also add a csipad declaration here as if the script
> is used on a board which is not D3 VIN4 would be connected to a CSI-2
> bus. Writing that I realise a new var 'csidev' or something would be
> needed here to expand this to cover the full range of VIN0-VIN7.
>
> > +        ;;
> >      *)
> >          echo "Unkown VC '$vc'"
> >          exit 1
> >  esac
> >
> >  mc_reset
> > -mc_set_link "$csi40name" $csipad "$vinname" 1
> > -mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "$=
vinname"
> > +if [[ "$hdminame" =3D=3D "adv7612 0-004c" ]]; then
>
>
> You should use $parallelname here not $hdminame. Furthermore I thin you
> should check if the variable is empty or not and not target it for a
> specific board.
>
> A good (or only) example of how I think this should be done can be found
> in test-qv4l2.sh.
>
>          if [[ "$csi20name" !=3D "" ]]; then
>              mc_set_link "$csi20name" 1 "$vinname1" 1
>              mc_propagate_cvbs "$vinname1"
>              qv4l2 -d /dev/$vin1
>          fi
>
>          if [[ "$parallelname" !=3D "" ]]; then
>              mc_reset
>              mc_set_link "$parallelname" 1 "$vinname0" 1
>              mc_propagate_parallel "$vinname0"
>              qv4l2 -d /dev/$vin0
>          fi
>

This will solve the naming thing in boards.sh

I'll try that and have a look at test-qv4l2.sh too!

Thanks
  j

> > +	mc_set_link "$hdminame" 1  "$vinname" 1
> > +	mc_propagate_parallel "$vinname"
> > +else
> > +	mc_set_link "$csi40name" $csipad "$vinname" 1
> > +	mc_propagate_format "$hdminame" 1 "$txaname" 0 "$csi40name" $csipad "=
$vinname"
> > +fi
> >
> >  out=3D/tmp/vin-tests
> >  rm -fr $out
> > --
> > 2.7.4
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund

--NqNl6FRZtoRUn5bW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbgSGXAAoJEHI0Bo8WoVY8dewQALGi5b4l3WDQL1lM/P8KzP8W
8iJ9X/Pu1WnRLcxDaBV9W3E2JXj7Jk5/3H2O8jK8Q4XRjYpThOuiX8MsG9NAIKAw
MHylXkpk9CsbbDsP3Hmkv2qtRaTfYmFzjRpToTmkBIn01wffSKYpoC6mFTx2uO70
JNFwwWlW4nLwdyXDJQpeinkfreM85boXmFo47zCGOrgMxYq5Zy8CW94iqctda+sl
Hla1KEMcEnJ3AZDJBpJQjNahok71hJU/eOlBQiOul86hmJn7OMRXZ3YzvMuhcXud
cvy3bVqWVjRTCzaNBTFSUOjxFLiyLJl21aLvjqmiPf34ZT8WD6lD7GhOmkfD+1N7
15MgOXkC8p4CKySOGpBC6GO9UJy2vuR0i49MX2FkrN/azauZQqqacLglIECB+C9H
kfpSr36qXD4ouNni/9zVaZdgbdC77jkdgsz+PkQ/zJls6mWVEy1aOdaWLyKAQRGM
8Tzv4ArsRRFytXQWXSasY0S18F9fkZLw7uHT4TXQdHZCdVU+8ZKrVDG8kfvBczLF
46HpGOWwvHhOWoywOdA5wWxAkyBzbFj3zzEUg+MA3pStlvQZl6F+alqKJlhwPMkY
tiQkwQ+0y/xzpfwXMdH7N+SRGUjRXiTYPG5tPWdWm9bR9X7Ku27K9BlDloTsUv+4
NVbRwEwE0Gu5uZko4aTA
=AuRo
-----END PGP SIGNATURE-----

--NqNl6FRZtoRUn5bW--
