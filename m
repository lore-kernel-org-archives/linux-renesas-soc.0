Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Mon, 1 Oct 2018 23:59:13 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Tony Lindgren <tony@atomide.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Phil Reid <preid@electromag.com.au>
Subject: Re: [RFC] i2c: reject transfers when adapter is suspended
Message-ID: <20181001215913.GA861@kunai>
References: <20181001174450.16625-1-wsa+renesas@sang-engineering.com>
 <53acc817-b982-6fc5-f5c1-5104968a2b33@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <53acc817-b982-6fc5-f5c1-5104968a2b33@redhat.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> IMHO the is_suspended flag should be set by the adapter driver from its
> own suspend callback (which may be a normal, late or noirq suspend callback),
> as this is the point past which the bus should no longer be used because
> e.g. the suspend callbacks has disabled clocks and/or put the controller
> in reset, etc.

That's what I meant with "not seeing the woods for the trees". Thanks
for clearing my view!

> the i2c-controller device where necessary. But you're hooking into the
> child-device of the actual "hardware" device which represents the i2c_adapter
> bits.

That was intentional because this is the device the I2C core has access
to. Because the callbacks deal only with 'is_suspended' and not with HW,
I thought the logic device could be suitable. I didn't think of
additional relations only affecting its parent.

> on the adapter-device. I believe that instead we should add
> i2c_adapter_mark_suspended and i2c_adapter_mark_resumed helpers and let
> the adapter-driver suspend/resume callbacks call these. This will ensure
> that they get called at the right phase and at the exact moment that
> the adapter is actually suspending.

Agreed. And these helpers are basically this:

> > +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> > +	adap->is_suspended = true;
> > +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);

and this:

> > +	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
> > +	adap->is_suspended = false;
> > +	i2c_unlock_bus(adap, I2C_LOCK_ROOT_ADAPTER);

together with this still in the I2C core:

> > @@ -1867,6 +1904,9 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> >   	if (WARN_ON(!msgs || num < 1))
> >   		return -EINVAL;
> > +	if (WARN_ON(adap->is_suspended))
> > +		return -ESHUTDOWN;
> > +
> >   	if (adap->quirks && i2c_check_for_quirks(adap, msgs, num))
> >   		return -EOPNOTSUPP;
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 65b4eaed1d96..ee46295a67d4 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -692,6 +692,8 @@ struct i2c_adapter {
> >   	const struct i2c_adapter_quirks *quirks;
> >   	struct irq_domain *host_notify_domain;
> > +
> > +	int is_suspended:1;

Are we aligned?

Thanks,

   Wolfram


--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluymK0ACgkQFA3kzBSg
KbZtPQ/8DGKinOY74CkPb9A13Eeqlnkw/ldxZcoYYFqMGMMKVGc/dHVbnwyAP7AL
FiC88Ndw8AwsoXHQSf0D9kotLFNaqtlMMBEdoTe1X/24LNU1K/zSVBESdF/8BGtx
IPqtgz9Rld82bXE1xlGjbqTm7B5f+v5J5JA4dsQOnCAcLKQbOQu2bWuZA41PwV0d
whOKxtJgmZ4u6xNstCHz8QVa7vWA6R1DL0JRh1ijnYgG7gzltW7mNowCdFFEZqPh
aXnPfnL3HJ0c4LggxTmN55ls8A8/2iKIoOxHNO/JN1aJcPQzAVziH1b7VMx9dr8L
8sOEuGFP83BULFKdZ6LqrzXLR6nwLuNhtOUOMvU+NSj3lMOJO6McWdzqINClQKtV
sWDK1uc1OlXdt8bdh5AuLuuuzv6MkCR80Fwnh6mogb954rHPQIv2f8tAWu4Nr97d
RkBK+NVvmUrcyhpNuVJsKQAz7KvfhpQLT0InRx7+aJv2Ghzc0a5uEYcK3P9IPWBm
j/H5VDjumxwywkFmo1Hp5J3jgtdwVZgx8dZ4gea++f0OJAY+WxJzWr4kXaJgVMMc
X10CCjXT3jSu50k4JONlobWSIFrAcIOvMAO5pZ64VDzw9uJjih2YCtCXSgh/WZIK
cUx1b0cvgw+aOMvO36Q/T1qG40uzCK0lY9Z+cHeZEu2sbW/vK+A=
=P6Na
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
