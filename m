Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46154 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbeEUJMz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 05:12:55 -0400
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <8256862.BA8i1yAIzy@avalon>
 <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
 <4976984.1bKa5JtaEO@avalon>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <e8af4ba2-5511-c898-4528-34572e9390e0@ideasonboard.com>
Date: Mon, 21 May 2018 10:12:50 +0100
MIME-Version: 1.0
In-Reply-To: <4976984.1bKa5JtaEO@avalon>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="5RME9kVVIKnzpYxqDSWMFFNe09sXXsiv6"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5RME9kVVIKnzpYxqDSWMFFNe09sXXsiv6
Content-Type: multipart/mixed; boundary="Es32Or0goFrVULQtQCJlOTIFRFGcXA3Kd";
 protected-headers="v1"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Message-ID: <e8af4ba2-5511-c898-4528-34572e9390e0@ideasonboard.com>
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <8256862.BA8i1yAIzy@avalon>
 <fbfea959-69a9-b497-ede7-7ab0287eb957@ideasonboard.com>
 <4976984.1bKa5JtaEO@avalon>
In-Reply-To: <4976984.1bKa5JtaEO@avalon>

--Es32Or0goFrVULQtQCJlOTIFRFGcXA3Kd
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 21/05/18 10:09, Laurent Pinchart wrote:
> Hi Kieran,
>=20
> On Monday, 21 May 2018 11:58:44 EEST Kieran Bingham wrote:
>> On 21/05/18 09:51, Laurent Pinchart wrote:
>>> On Monday, 21 May 2018 11:16:05 EEST Kieran Bingham wrote:
>>>> On 19/05/18 21:34, Laurent Pinchart wrote:
>>>>> The suspend/resume test starts a run of 300 frames and suspends the=

>>>>> system one second later. On some SoCs (namely H3 ES2.0) the VSP
>>>>> bandwidth is high enough to complete processing of 300 frames in le=
ss
>>>>> than a second. The test thus suspends and resumes the system with t=
he
>>>>> VSP idle instead of running, defeating the purpose of the test.
>>>>>
>>>>> Fix this by increasing the number of frames to process to 1000. The=

>>>>> frame count is now passed as an argument to the
>>>>> test_extended_wpf_packing function to ease future changes.
>>>>
>>>> Great idea, to make it easy to update and re-use.
>>>>
>>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>=

>>>>
>>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com=
>
>>>>
>>>>> ---
>>>>>
>>>>>  tests/vsp-unit-test-0020.sh | 15 ++++++++-------
>>>>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020=
=2Esh
>>>>> index 91f6b167f22e..950c1bebbf2f 100755
>>>>> --- a/tests/vsp-unit-test-0020.sh
>>>>> +++ b/tests/vsp-unit-test-0020.sh
>=20
> [snip]
>=20
>>>>>  test_hw_pipe() {
>>>>> -	test_extended_wpf_packing RGB24
>>>>> +	# Run the pipeline for 1000 frames. The suspend action occurs
>>>>> between
>>>>> +	# frame #500~#600
>>>>
>>>> I'm not sure it's worth stating when the suspend action occurs, as i=
t's
>>>> variable depending upon the performance of the SoC ... but I'll not
>>>> object to this.
>>>
>>> I agree with you, I'll remove that.
>>>
>>> I think it would make sense to run the pipeline without a limit in th=
e
>>> frame count, and stop streaming after resume. Feel free to give it a =
try
>>> if you want :-)
>>
>> The question here will be how to we get the frame verification to occu=
r on
>> the 'last N frames'
>>
>> For this, wouldn't we need to extend yavta to support some kind of sig=
nal to
>> perform a stream validation at an earlier point and shutdown the strea=
m
>> (probably leaving the count/skip, as maximum durations to run...) And =
then
>> making sure we knew which frames were actually written out ...
>>
>> I'll leave this ticking in the back of my mind for now :D
>=20
> Maybe it will be easier to address when we'll rewrite the tests in Pyth=
on ?=20
> :-)

Possibly - I need to look at Niklas' updates to his vin-tests.

I'm sure there is a lot of potential code - reuse between testing the VIN=
 and
the VSP!.

--
Kieran



>>>>> +	test_extended_wpf_packing RGB24 1000
>>>>>  }
>=20


--Es32Or0goFrVULQtQCJlOTIFRFGcXA3Kd--

--5RME9kVVIKnzpYxqDSWMFFNe09sXXsiv6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEkC3XmD+9KP3jctR6oR5GchCkYf0FAlsCjZIACgkQoR5GchCk
Yf3bgA/8DNiqLDOhEMe11lWUhQ9PRadIu+1R9bxHq/6Fohl+qlsvYlSlPdmILS93
txhqeV0Ev7oVvE1qCN5DyQYrapOvZu//Dgr1/3TyqkBEfs69gFesQdQZu8v0y1PA
TZTr5aLmIdjOPuYwMNtbQxAyXyaHadbsPJg3FlZzaWq/fPojqowfytEyCVE3deEK
8FQfXOMpPN2unkumxT2M278SdlnrvJohjxTXgjNccV/VNdfxiwJZek8ir/4HQuhD
SPNczDuS6J4//SCFtzlzdokCqeG1939I9aEkCL8TYXgLikBqdCeETXib+z6Z4sHN
K+nz7sLjjrd1iLJ42VEO10I8ucnX1AiTlHNRFtU67SBrq+6pqDkG3LlE2d6g/t85
5DnN1Xj0Jks6xIZ8htxNOdiX8CprggGcPrbDyc2WaBy/QjRRGjQclQ/gc8Yj7UmZ
5K9Wjil4MpIXk7u2XdXGcWb+0xj6fr0sBEfZc6zZrzJQhUAw9owlCvWddN2CYtfa
Iwtgluzvu+qB2KSPm+oi6xw9yMbmUgTcMwQkZNwrk979aVxfCfdkF6c8P/GZJaLI
VgTM0/jDh91vkTw+fsbqFrdRCUEiUEiW+HAe7jXhgb03N/cYTMVZH6zdOaXwHs2U
3xZEYgG3pvTX9oSwpkJIfH8BLZYoIX+3R9epYX1dVV3QDmsKFAk=
=nTHy
-----END PGP SIGNATURE-----

--5RME9kVVIKnzpYxqDSWMFFNe09sXXsiv6--
